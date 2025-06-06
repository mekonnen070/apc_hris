using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Training;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using PeerageHRIS.Resources.Models.Training;

namespace PeerageHRIS.Models.Training
{
    public class TrainingNeedAnalysis
    {
        [Key]
        [Display(Name = "AnalysisId", ResourceType = typeof(TrainingResource))]
        public int AnalysisId { get; set; }

        [Required(ErrorMessageResourceName = "AnalysisName_Required",  ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AnalysisName", ResourceType = typeof(TrainingResource))]
        public string? AnalysisName { get; set; }

        [Required(ErrorMessageResourceName = "AnalysisDate_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AnalysisDate", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        public DateTime AnalysisDate { get; set; } = DateTime.UtcNow;

        [Required(ErrorMessageResourceName = "ValidUntil_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ValidUntil", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        public DateTime ValidUntil { get; set; } = DateTime.UtcNow.AddYears(1); 

        [StringLength(500, ErrorMessageResourceName = "Justification_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "Justification", ResourceType = typeof(TrainingResource))]
        public string? Justification { get; set; }

        [StringLength(500, ErrorMessageResourceName = "Comments_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "Comments", ResourceType = typeof(TrainingResource))]
        public string? Comments { get; set; }

        [Required(ErrorMessageResourceName = "RequestedBy_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequestedBy", ResourceType = typeof(TrainingResource))]
        public string? RequestedBy { get; set; }

        [Required(ErrorMessageResourceName = "RequestDate_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequestDate", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; } = DateTime.UtcNow;

        //[StringLength(500, ErrorMessageResourceName = "DevelopmentPlan_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        //[Display(Name = "DevelopmentPlan", ResourceType = typeof(TrainingResource))]
        //public string DevelopmentPlan { get; set; }

        public ICollection<SkillMatrix> RequiredSkills { get; set; } = [];
    }
}