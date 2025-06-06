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
    public class ApplicantTracking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "TrackingId", ResourceType = typeof(TrainingResource))]
        public int Id { get; set; }

        [Required(ErrorMessageResourceName = "EvaluationIdRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EvaluationId", ResourceType = typeof(TrainingResource))]
        public int EvaluationId { get; set; }
         
        [Display(Name = "EmployeeId", ResourceType = typeof(TrainingResource))]
        public string? EmployeeId { get; set; }
         
        [Display(Name = "TrainCourseId", ResourceType = typeof(TrainingResource))]
        public int TrainCourseId { get; set; }

        [Precision(18, 2)]
        [Range(0, 100, ErrorMessageResourceName = "EvaluationScoreRange", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EvaluationScore", ResourceType = typeof(TrainingResource))]
        public decimal EvaluationScore { get; set; }

        [Display(Name = "ApplicantRank", ResourceType = typeof(TrainingResource))]
        public int ApplicantRank { get; set; }

        [DataType(DataType.Date)] 
        [Display(Name = "TrainStartDate", ResourceType = typeof(TrainingResource))]
        public DateTime? TrainStartDate { get; set; }

        [DataType(DataType.Date)] 
        [Display(Name = "TrainEndDate", ResourceType = typeof(TrainingResource))]
        public DateTime? TrainEndDate { get; set; }

        [MaxLength(200)]
        [Display(Name = "TraineeInstitute", ResourceType = typeof(TrainingResource))]
        public string? TraineeInstitute { get; set; }

        [StringLength(500, ErrorMessageResourceName = "CommentsLength", ErrorMessageResourceType = typeof(TrainingResource))]
        [DataType(DataType.MultilineText)]
        [Display(Name = "Comments", ResourceType = typeof(TrainingResource))]
        public string? TrackingComment { get; set; }
 
        [Display(Name = "Status", ResourceType = typeof(TrainingResource))]
        public ApplicantStatus TrackingStatus { get; set; }

        // Audit fields with improved validation
        [Display(Name = "EnteredBy", ResourceType = typeof(TrainingResource))]
        public string EnterBy { get; set; } = string.Empty;
    
        [DataType(DataType.DateTime)]
        [Display(Name = "EntryDate", ResourceType = typeof(TrainingResource))]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        // Navigation property with explicit foreign key
        [ForeignKey(nameof(EvaluationId))]
        [Display(Name = "EvaluatedApplicant", ResourceType = typeof(TrainingResource))]
        public virtual ApplicantEvaluation? EvaluatedApplicant { get; set; } 
    } 
}