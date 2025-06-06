using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Training;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using PeerageHRIS.Resources.Models.Training;

namespace PeerageHRIS.Models.Training
{
    public class DevelopmentPlan
    {
        [Key]
        [Display(Name = "PlanId", ResourceType = typeof(TrainingResource))]
        public string? PlanId { get; set; }

        [Required(ErrorMessageResourceName = "PlanName_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PlanName", ResourceType = typeof(TrainingResource))]
        [MaxLength(100, ErrorMessageResourceName = "PlanName_MaxLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? PlanName { get; set; }

        [Required(ErrorMessageResourceName = "PlanType_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PlanType", ResourceType = typeof(TrainingResource))]
        public TrainingTypes PlanType { get; set; }

        [Required(ErrorMessageResourceName = "PlanDescription_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PlanDescription", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.MultilineText)]
        public string? PlanDescription { get; set; }

        [Required(ErrorMessageResourceName = "PlanCost_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        [Display(Name = "PlanCost", ResourceType = typeof(TrainingResource))]
        [Range(0, 10000000, ErrorMessageResourceName = "PlanCost_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        public decimal? PlanCost { get; set; }

        [Required(ErrorMessageResourceName = "UsedCost_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Precision(18, 2)]
        [Display(Name = "UsedCost", ResourceType = typeof(TrainingResource))]
        public decimal? UsedCost { get; set; } = 0;

        [Required(ErrorMessageResourceName = "PlanCurrency_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PlanCurrency", ResourceType = typeof(TrainingResource))]
        public Currency PlanCurrency { get; set; }

        [Display(Name = "DevelopmentSource", ResourceType = typeof(TrainingResource))]
        public DevelopmentSource DevelopmentSource { get; set; }

        [Required(ErrorMessageResourceName = "PlanStatus_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "PlanStatus", ResourceType = typeof(TrainingResource))]
        public GeneralStatus PlanStatus { get; set; } = GeneralStatus.Pending;
         
        [Display(Name = "PlanEntryBy", ResourceType = typeof(TrainingResource))]
        public string? PlanEntryBy { get; set; }
         
        [Display(Name = "PlanEntryDate", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        public DateTime? PlanEntryDate { get; set; }

        [Display(Name = "TrainingList", ResourceType = typeof(TrainingResource))]
        public ICollection<ManageTraining>? TrainingList { get; set; }
    }
}