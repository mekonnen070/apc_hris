using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Resources.Models.Training;

namespace PeerageHRIS.Models.Training
{
    public class SkillMatrix
    {
        [Key]
        [Display(Name = "MatrixId", ResourceType = typeof(TrainingResource))]
        public int MatrixId { get; set; }

        [Required(ErrorMessageResourceName = "EmployeeId_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EmployeeId", ResourceType = typeof(TrainingResource))]
        public string? EmployeeId { get; set; }

        [Required(ErrorMessageResourceName = "AnalysisId_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AnalysisId", ResourceType = typeof(TrainingResource))]
        public int AnalysisId { get; set; }

        [Required(ErrorMessageResourceName = "SkillName_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "SkillName_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "SkillName", ResourceType = typeof(TrainingResource))]
        public string? SkillName { get; set; }

        [Required(ErrorMessageResourceName = "Category_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "Category", ResourceType = typeof(TrainingResource))]
        public SkillCategory Category { get; set; }

        [Required(ErrorMessageResourceName = "CurrentProficiency_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Range(1, 5, ErrorMessageResourceName = "CurrentProficiency_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "CurrentProficiency", ResourceType = typeof(TrainingResource))]
        public PriorityLevel CurrentProficiency { get; set; }

        [Required(ErrorMessageResourceName = "RequiredProficiency_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Range(1, 5, ErrorMessageResourceName = "RequiredProficiency_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequiredProficiency", ResourceType = typeof(TrainingResource))]
        public PriorityLevel RequiredProficiency { get; set; }

        [Required(ErrorMessageResourceName = "Priority_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "Priority", ResourceType = typeof(TrainingResource))]
        public PriorityLevel Priority { get; set; } = PriorityLevel.Medium;

        [Required(ErrorMessageResourceName = "EntryByRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EntryBy", ResourceType = typeof(TrainingResource))]
        public string? EntryBy { get; set; }

        [Required(ErrorMessageResourceName = "EntryDateRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EntryDate", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        [ForeignKey(nameof(EmployeeId))]
        [Display(Name = "Employee", ResourceType = typeof(TrainingResource))]
        public EmployeeInfo? Employee { get; set; }

        [ForeignKey(nameof(AnalysisId))]
        [Display(Name = "TrainingNeedAnalysis", ResourceType = typeof(TrainingResource))]
        public TrainingNeedAnalysis? TrainingNeedAnalysis { get; set; }
    }
}