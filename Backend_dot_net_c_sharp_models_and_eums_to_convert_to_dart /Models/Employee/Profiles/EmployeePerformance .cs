using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.Localization;
using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Employee.Profiles;

namespace PeerageHRIS.Models.Employee.Profiles
{
    public class EmployeePerformance
    {
        [Key]
        public int PerformanceId { get; set; }

        [Required(ErrorMessage = "The Employee field is required.")]
        [Display(Name = "Employee", ResourceType = typeof(EmployeePerformanceResources))]
        public string? EmployeeId { get; set; }
         
        [Required(ErrorMessageResourceName = "ScorePointRequired", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Range(1, 100, ErrorMessageResourceName = "ScorePointRange", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Display(Name = "ScorePoint", ResourceType = typeof(EmployeePerformanceResources))]
        public int ScorePoint { get; set; }

        [Required(ErrorMessageResourceName = "RatingRequired", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Range(1, 5, ErrorMessageResourceName = "RatingRange", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Display(Name = "Rating", ResourceType = typeof(EmployeePerformanceResources))]
        public int Rating { get; set; }

        [StringLength(500, ErrorMessageResourceName = "CommentsLength", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [DataType(DataType.MultilineText)]
        [Display(Name = "Comments", ResourceType = typeof(EmployeePerformanceResources))]
        public string? Comments { get; set; }

        [Required(ErrorMessageResourceName = "EvaluationDateRequired", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [DataType(DataType.Date, ErrorMessageResourceName = "InvalidDateFormat", ErrorMessageResourceType = typeof(CommonResources))]
        [Display(Name = "EvaluationDate", ResourceType = typeof(EmployeePerformanceResources))]
        public DateTime EvaluationDate { get; set; } = DateTime.Today;

        [Required(ErrorMessageResourceName = "EvaluatorNameRequired", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [StringLength(100, ErrorMessageResourceName = "EvaluatorNameLength", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Display(Name = "EvaluatorName", ResourceType = typeof(EmployeePerformanceResources))]
        public string? EvaluatorName { get; set; }

        [StringLength(1000, ErrorMessageResourceName = "KeyAchievementsLength", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Display(Name = "KeyAchievements", ResourceType = typeof(EmployeePerformanceResources))]
        public string? KeyAchievements { get; set; }

        [StringLength(1000, ErrorMessageResourceName = "AreasForImprovementLength", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        [Display(Name = "AreasForImprovement", ResourceType = typeof(EmployeePerformanceResources))]
        public string? AreasForImprovement { get; set; }

        [DataType(DataType.Date, ErrorMessageResourceName = "InvalidDateFormat", ErrorMessageResourceType = typeof(CommonResources))]
        [Display(Name = "FromDate", ResourceType = typeof(EmployeePerformanceResources))]
        public DateTime? FromDate { get; set; }

        [DataType(DataType.Date, ErrorMessageResourceName = "InvalidDateFormat", ErrorMessageResourceType = typeof(CommonResources))]
        [Display(Name = "ToDate", ResourceType = typeof(EmployeePerformanceResources))]
        public DateTime? ToDate { get; set; }

        [DataType(DataType.Date, ErrorMessageResourceName = "InvalidDateFormat", ErrorMessageResourceType = typeof(CommonResources))]
        [Display(Name = "NextEvaluationDate", ResourceType = typeof(EmployeePerformanceResources))]
        [FutureDateValidation(ErrorMessageResourceName = "FutureDateRequired", ErrorMessageResourceType = typeof(EmployeePerformanceResources))]
        public DateTime? NextEvaluationDate { get; set; }

        // Localized rating description (not mapped to database)
        [NotMapped]
        public string RatingDescription => GetLocalizedRatingDescription(Rating);

        [Display(Name = "UpdateBy", ResourceType = typeof(CommonResources))]
        public string? UpdateBy { get; set; }

        [Display(Name = "UpdateDate", ResourceType = typeof(CommonResources))]
        public DateTime UpdateDate { get; set; } = DateTime.UtcNow;

        [ForeignKey(nameof(EmployeeId))]
        [Display(Name = "Employee", ResourceType = typeof(EmployeeUploadResources))]
        public EmployeeInfo? Employee { get; set; }

        private string GetLocalizedRatingDescription(int rating)
        {
            return rating switch
            {
                5 => EmployeePerformanceResources.Rating5Description,
                4 => EmployeePerformanceResources.Rating4Description,
                3 => EmployeePerformanceResources.Rating3Description,
                2 => EmployeePerformanceResources.Rating2Description,
                1 => EmployeePerformanceResources.Rating1Description,
                _ => EmployeePerformanceResources.RatingUnknown,
            };
        }

        // Server-side rating calculation
        public void CalculateRating()
        {
            Rating = ScorePoint switch
            {
                >= 90 => 5,
                >= 75 => 4,
                >= 60 => 3,
                >= 40 => 2,
                _ => 1
            };
        }
    }

    public class FutureDateValidationAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value is DateTime dateValue)
            {
                if (dateValue <= DateTime.Today)
                {
                    var localizer = validationContext.GetService<IStringLocalizer<EmployeePerformanceResources>>();
                    return new ValidationResult(localizer["FutureDateRequired"]);
                }
            }
            return ValidationResult.Success;
        }
    }
}