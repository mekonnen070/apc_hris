using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PeerageHRIS.Enumeration.Commission;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace PeerageHRIS.Models.Organization
{
    public class OrganizationScale
    {
        [Key]
        [Display(Name = "ID")]
        public string ScaleId { get; set; }

        [Required]
        [Display(Name = "Rank Name")]
        public string LevelId { get; set; }

        [Required]
        [Display(Name = "Scale Name")]
        [Column(TypeName = "nvarchar(450)")]
        [StringLength(450, ErrorMessage = "Scale name cannot exceed 450 characters")]
        public string ScaleName { get; set; }

        [Display(Name = "Scale Salary")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue, ErrorMessage = "Salary must be a positive value")]
        public decimal ScaleSalary { get; set; }

        public bool Enabled { get; set; } = true;

        [Display(Name = "Grade Step")]
        //[Range(1, 10, ErrorMessage = "Grade step must be between 1 and 10")]
        public int GradeStep { get; set; } = 1;  // Default to minimum
        //public int GradeStep
        //{
        //    get => _gradeStep;
        //    set
        //    {
        //        if (value < 1 || value > 10)
        //        {
        //            throw new ArgumentOutOfRangeException(nameof(GradeStep), "Grade step must be between 1 and 10");
        //        }
        //        _gradeStep = value;
        //    }
        //}

        [Display(Name = "Next Promotion Period (months)")]
        [Range(1, 60, ErrorMessage = "Promotion period must be between 1 and 60 months")]
        public int PromotionPeriod { get; set; } = 12;

        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }

        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        public StructureType StructureType { get; set; } = StructureType.Scale;

        [ForeignKey(nameof(LevelId))]
        public virtual OrganizationRank? JobLevel { get; set; }

        // Custom validation method
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            var results = new List<ValidationResult>();

            // Validate grade step against job level constraints
            if (JobLevel != null)
            {
                if (JobLevel.MaxGradeSteps.HasValue && GradeStep > JobLevel.MaxGradeSteps.Value)
                {
                    results.Add(new ValidationResult($"Grade step cannot exceed maximum of {JobLevel.MaxGradeSteps} for this job level",new[] { nameof(GradeStep) }));
                }

                if (JobLevel.MinGradeSteps.HasValue && GradeStep < JobLevel.MinGradeSteps.Value)
                {
                    results.Add(new ValidationResult($"Grade step cannot be less than minimum of {JobLevel.MinGradeSteps} for this job level",new[] { nameof(GradeStep) }));
                }
                // Validate that grade steps are sequential (no gaps)
                if (JobLevel.ExistingGradeSteps != null && JobLevel.ExistingGradeSteps.Any())
                {
                    var expectedNextStep = JobLevel.ExistingGradeSteps.Max() + 1;
                    if (GradeStep != 1 && GradeStep != expectedNextStep)
                    {
                        results.Add(new ValidationResult( $"New grade steps must be sequential. The next expected grade step is {expectedNextStep}", new[] { nameof(GradeStep) }));
                    }
                }
            }

            // Validate that salary is appropriate for the grade step
            if (JobLevel != null && JobLevel.LevelRanks != null)
            {
                var previousScale = JobLevel.LevelRanks
                    .Where(s => s.GradeStep < this.GradeStep)
                    .OrderByDescending(s => s.GradeStep)
                    .FirstOrDefault();

                if (previousScale != null && ScaleSalary <= previousScale.ScaleSalary)
                {
                    results.Add(new ValidationResult(  $"Salary for grade step {GradeStep} must be higher than the previous step ({previousScale.GradeStep})",  new[] { nameof(ScaleSalary) }));
                }

                var nextScale = JobLevel.LevelRanks
                    .Where(s => s.GradeStep > this.GradeStep)
                    .OrderBy(s => s.GradeStep)
                    .FirstOrDefault();

                if (nextScale != null && ScaleSalary >= nextScale.ScaleSalary)
                {
                    results.Add(new ValidationResult(  $"Salary for grade step {GradeStep} must be lower than the next step ({nextScale.GradeStep})",  new[] { nameof(ScaleSalary) }));
                }
            }
            return results;
        }
    }

    // Configuration for Entity Framework
    public class OrganizationScaleConfiguration : IEntityTypeConfiguration<OrganizationScale>
    {
        public void Configure(EntityTypeBuilder<OrganizationScale> builder)
        {
            builder.HasIndex(x => new { x.LevelId, x.GradeStep })
                  .IsUnique()
                  .HasDatabaseName("IX_OrganizationScale_LevelId_GradeStep");

            builder.HasOne(x => x.JobLevel)
                  .WithMany(x => x.LevelRanks)
                  .HasForeignKey(x => x.LevelId)
                  .OnDelete(DeleteBehavior.Restrict);

            builder.Property(x => x.ScaleSalary)
                  .HasPrecision(18, 2);
        }
    }
}