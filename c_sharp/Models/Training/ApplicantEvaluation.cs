using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Training
{
    public class ApplicantEvaluation
    {
        [Key]
        [Display(Name = "EvaluationId", ResourceType = typeof(TrainingResource))]
        public int Id { get; set; }

        [Required(ErrorMessageResourceName = "FieldRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "SelectionId", ResourceType = typeof(TrainingResource))]
        public int SelectionId { get; set; }

        [Required(ErrorMessageResourceName = "FieldRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EmployeeId", ResourceType = typeof(TrainingResource))]
        public string? EmployeeId { get; set; }

        // Performance Evaluation (40%)
        [Range(0, 40, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PerformanceScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal PerformanceScore { get; set; }

        [Range(51, 100, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PerformanceExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal PerformanceExpectation { get; set; } = 0;

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PerformanceDescription", ResourceType = typeof(TrainingResource))]
        public string? PerformanceDescription { get; set; }

        // Service Evaluation (25%)
        [Range(3, 25, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ServiceScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal ServiceScore { get; set; } = 0;

        [Range(3, 65, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ServiceExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal ServiceExpectation { get; set; } = 0;

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ServiceDescription", ResourceType = typeof(TrainingResource))]
        public string? ServiceDescription { get; set; }

        // Education Evaluation (20%)
        [Range(0, 20, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EducationScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal EducationScore { get; set; } = 0;

        [Range(0, 4, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EducationExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal EducationExpectation { get; set; } = 0;

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EducationDescription", ResourceType = typeof(TrainingResource))]
        public string? EducationDescription { get; set; }

        // Training Relevance (5%)
        [Range(0, 5, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingRelevanceScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal TrainingRelevanceScore { get; set; } = 0;

        [Range(0, 5, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingRelevanceExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public RelativeReference TrainingRelevanceExpectation { get; set; } = 0;

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingRelevanceDescription", ResourceType = typeof(TrainingResource))]
        public string? TrainingRelevanceDescription { get; set; }

        // Age Consideration (5%)
        [Range(0, 5, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AgeScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal AgeScore { get; set; } = 0;

        [Range(18, 65, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AgeExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal AgeExpectation { get; set; } = 0;

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AgeDescription", ResourceType = typeof(TrainingResource))]
        public string? AgeDescription { get; set; }

        // Profile Quality (5%)
        [Range(0, 5, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ProfileQualityScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal ProfileQualityScore { get; set; } = 0;

        [Range(0, 5, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ProfileQualityExpectation", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public TrainingProfileReference ProfileQualityExpectation { get; set; }

        [StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ProfileQualityDescription", ResourceType = typeof(TrainingResource))]
        public string? ProfileQualityDescription { get; set; }

        // Affirmative Action (5%)
        [Range(0, 5, ErrorMessageResourceName = "AffirmativeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AffirmativeScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal AffirmativeScore { get; set; } = 0; 
        [Display(Name = "AffirmativeExpectation", ResourceType = typeof(TrainingResource))] 
        public Gender AffirmativeExpectation { get; set; } = 0;
         

        [Display(Name = "HasPriority", ResourceType = typeof(TrainingResource))]
        public bool HasPriority { get; set; }

        // Total Score
        [Range(0, 100, ErrorMessageResourceName = "RangeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TotalScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal TotalScore { get; set; } = 0.00m;

        [StringLength(500, ErrorMessageResourceName = "Comments_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "Comments", ResourceType = typeof(TrainingResource))]
        public string? Comments { get; set; }

        // Selection Status
        [Display(Name = "SelectStatus", ResourceType = typeof(TrainingResource))]
        public ApplicantStatus EvaluationStatus { get; set; }
        // Audit fields
        [Required(ErrorMessageResourceName = "FieldRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EnteredBy", ResourceType = typeof(TrainingResource))]
        public string? EnteredBy { get; set; }

        [Required(ErrorMessageResourceName = "FieldRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EntryDate", ResourceType = typeof(TrainingResource))]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        // Navigation property
        [ForeignKey(nameof(SelectionId))]
        [Display(Name = "SelectedApplicant", ResourceType = typeof(TrainingResource))]
        public ApplicantSelection? SelectedApplicant { get; set; }

        // Calculated property (not mapped to database)
        [NotMapped]
        public bool MeetsMinimumRequirements =>
            PerformanceScore >= PerformanceExpectation * 0.4m &&
            ServiceScore >= ServiceExpectation;

        public decimal CalculateWeightedTotal()
        { 
            decimal total = PerformanceExpectation * 0.40m +
                           ServiceScore * 0.25m +          // 25% weight
                           EducationScore * 0.20m +        // 20% weight
                           TrainingRelevanceScore * 0.05m + // 5% weight
                           AgeScore * 0.05m +              // 5% weight
                           ProfileQualityScore * 0.05m +   // 5% weight
                           AffirmativeScore * 0.05m;           // 5% weight
            //return Math.Min(total, 100); // Ensure total doesn't exceed 100%
            return Math.Min(decimal.Round(total, 2), 100);
        }
    }
}