using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Placement
{
    public class PlacementEvaluation
    {
        [Key] [Required]
        [Display(Name ="Evaluation Id")]
        public int EvaluationId {  get; set; }

        [Required]
        [Display(Name = "Selection")]
        public int SelectionId { get; set; }

        [ForeignKey(nameof(SelectionId))]
        [JsonIgnore]
        [ValidateNever]
        public PlacementSelection? Selection { get; set; }

        [Required]
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }


        // Evaluation Criterias
        // Performance Evaluation (40%)
        [Range(0, 40)]
        [Display(Name = "Performance Score")]
        [Precision(18, 2)]
        public decimal PerformanceScore { get; set; }

        [Range(51, 100)]
        [Display(Name = "Performance Expectation")]
        [Precision(18, 2)]
        public decimal PerformanceExpectation { get; set; } = 0;

        [Display(Name = "Performance Description")]
        public string? PerformanceDescription { get; set; }


        // Service Evaluation (15%)
        [Range(2, 25)]
        [Display(Name = "Service Score")]
        [Precision(18, 2)]
        public decimal ServiceScore { get; set; } = 0;

        [Range(2, 65)]
        [Display(Name = "Service Expectation")]
        [Precision(18, 2)]
        public decimal ServiceExpectation { get; set; } = 0;

        [Display(Name = "Service Description")]
        public string? ServiceDescription { get; set; }

        // Education Evaluation (30%)
        [Range(0, 23)]
        [Display(Name = "Education Score")]
        [Precision(18, 2)]
        public decimal EducationScore { get; set; } = 0;

        [Range(0, 4)]
        [Display(Name = "Education Expectation")]
        [Precision(18, 2)]
        public PlacementEducation? EducationExpectation { get; set; } = 0;

        [Display(Name = "Education Description")]
        public string? EducationDescription { get; set; }


        // Title / Rank (10%)
        [Range(0, 5)]
        [Display(Name = "Title Score")]
        [Precision(18, 2)]
        public decimal TitleScore { get; set; } = 0;

        [Range(0, 5)]
        [Display(Name = "Profile Quality Expectation")]
        [Precision(18, 2)]
        public PlacementTitles TitleExpectation { get; set; }

        [Display(Name = "Profile Quality Description")]
        public string? TitleDescription { get; set; }

        // Profile Quality (5%)
        [Range(0, 5)]
        [Display(Name = "Profile Quality Score")]
        [Precision(18, 2)]
        public decimal ProfileQualityScore { get; set; } = 0;

        [Range(0, 5)]
        [Display(Name = "Profile Quality Expectation")]
        [Precision(18, 2)]
        public TrainingProfileReference ProfileQualityExpectation { get; set; }

        [Display(Name = "Profile Quality Description")]
        public string? ProfileQualityDescription { get; set; }

        // Affirmative Action (5%)
        [Range(0, 5, ErrorMessageResourceName = "AffirmativeValidation", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AffirmativeScore", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        public decimal AffirmativeScore { get; set; } = 0;
        [Display(Name = "AffirmativeExpectation", ResourceType = typeof(TrainingResource))]
        public Gender AffirmativeExpectation { get; set; } = 0;
        [Display(Name = "Has Priority Letter of Appreciation")]
        public bool LetterOfAppreciation { get; set; }

        // Total Score
        [Range(0, 100)]
        [Display(Name = "Total Score")]
        [Precision(18, 2)]
        public decimal TotalScore { get; set; } = 0.00m;

        [Display(Name = "Comments")]
        public string? Comments { get; set; }

        [Display(Name = "Entery dBy")]
        public string? EnteryBy { get; set; }

        [Display(Name = "EntryDate")]
        [DataType(DataType.Date)]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp.Date;

        public decimal CalculateWeightedTotal()
        {
            decimal total = PerformanceExpectation * 0.40m +    // 40%
                           EducationScore * 0.30m +        // 30% weight
                           ServiceScore * 0.15m +          // 15% weight
                           TitleScore * 0.10m +              // 10% weight
                           ProfileQualityScore * 0.05m +   // 5% weight
                           AffirmativeScore * 0.03m;           // 3% weight
            //return Math.Min(total, 100); // Ensure total doesn't exceed 100%
            return Math.Min(decimal.Round(total, 2), 100);
        }
    }
}
