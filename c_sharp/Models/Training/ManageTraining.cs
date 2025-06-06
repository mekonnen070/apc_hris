using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.Extensions.Localization;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Resources.Models.Training;
using Newtonsoft.Json;
using PeerageHRIS.Constants;
using Microsoft.EntityFrameworkCore;

namespace PeerageHRIS.Models.Training
{
    public class ManageTraining
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "ID", ResourceType = typeof(TrainingResource))]
        public int TrainingId { get; set; }

        [Required(ErrorMessageResourceName = "TrainingName_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "TrainingName_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingName", ResourceType = typeof(TrainingResource))]
        public string? TrainingName { get; set; }

        [Required(ErrorMessageResourceName = "TrainingType_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingType", ResourceType = typeof(TrainingResource))]
        public string? TrainingType { get; set; }

        [Required(ErrorMessageResourceName = "TrainingModality_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingModality", ResourceType = typeof(TrainingResource))]
        public TrainingModality TrainingModality { get; set; }

        [Required(ErrorMessageResourceName = "TrainingWarranty_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingWarranty", ResourceType = typeof(TrainingResource))]
        public TrainingWarranty TrainingWarranty { get; set; }

        [Required(ErrorMessageResourceName = "TrainingQualification_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingQualification", ResourceType = typeof(TrainingResource))]
        public QualificationType TrainingQualification { get; set; }

        [Required(ErrorMessageResourceName = "TrainingDescription_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(500, ErrorMessageResourceName = "TrainingDescription_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [DataType(DataType.MultilineText)]
        [Display(Name = "TrainingDescription", ResourceType = typeof(TrainingResource))]
        public string? TrainingDescription { get; set; }

        [Required(ErrorMessageResourceName = "TrainingLocation_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "TrainingLocation_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingLocation", ResourceType = typeof(TrainingResource))]
        public string? TrainingLocation { get; set; }

        [Required(ErrorMessageResourceName = "TrainingInstitution_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "TrainingInstitution_Length", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingInstitution", ResourceType = typeof(TrainingResource))]
        public string? TrainingInstitution { get; set; }

        [Required(ErrorMessageResourceName = "TrainingStartDate_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        [Display(Name = "TrainingStartDate", ResourceType = typeof(TrainingResource))]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TrainingStartDate { get; set; }

        [Required(ErrorMessageResourceName = "TrainingEndDate_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        [Display(Name = "TrainingEndDate", ResourceType = typeof(TrainingResource))]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TrainingEndDate { get; set; }

        [Range(0, int.MaxValue, ErrorMessageResourceName = "TraineeRequired_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TraineeRequired", ResourceType = typeof(TrainingResource))]
        public int TraineeRequired { get; set; }

        [Range(0, int.MaxValue, ErrorMessageResourceName = "TraineeActual_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TraineeActual", ResourceType = typeof(TrainingResource))]
        public int TraineeActual { get; set; } = 0;

        [Required(ErrorMessageResourceName = "RequiredEducation_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequiredEducation", ResourceType = typeof(TrainingResource))]
        public string? RequiredEducation { get; set; }

        [Range(0, int.MaxValue, ErrorMessageResourceName = "RequiredExperience_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequiredExperience", ResourceType = typeof(TrainingResource))]
        public int RequiredExperience { get; set; }

        [Required(ErrorMessageResourceName = "RequiredSex_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RequiredSex", ResourceType = typeof(TrainingResource))]
        public Gender RequiredSex { get; set; }

        [DataType(DataType.Currency)]
        [Range(0, double.MaxValue, ErrorMessageResourceName = "TrainingCost_Range", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "TrainingCost", ResourceType = typeof(TrainingResource))]
        [Precision(18, 2)] // Ensure precision for currency values
        public decimal TrainingCost { get; set; }

        //[Required(ErrorMessageResourceName = "TrainingCurrency_Required", ErrorMessageResourceType = typeof(TrainingResource))] 
        //[Display(Name = "TrainingCurrency", ResourceType = typeof(TrainingResource))]
        //public string TrainingCurrency { get; set; } = "ETB";
        [Required]
        [Display(Name = "TrainingStatus", ResourceType = typeof(TrainingResource))]
        public GeneralStatus TrainingStatus { get; set; } = GeneralStatus.Pending;

        [Required(ErrorMessageResourceName = "RegistrationLocation_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "RegistrationLocation", ResourceType = typeof(TrainingResource))]
        public string? RegistrationLocation { get; set; }


        [Required(ErrorMessageResourceName = "PostEndDateEndDate_Required", ErrorMessageResourceType = typeof(TrainingResource))]
        [DataType(DataType.Date)]
        [Display(Name = "PostEndDate", ResourceType = typeof(TrainingResource))]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime PostEndDate { get; set; } = PeerageConstant.CurrentTimeStamp.AddDays(5);

        [Display(Name = "TrainingEntryBy", ResourceType = typeof(TrainingResource))]
        public string? TrainingEntryBy { get; set; }
         
        [DataType(DataType.DateTime)]
        [Display(Name = "TrainingEntryDate", ResourceType = typeof(TrainingResource))]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime TrainingEntryDate { get; set; } = DateTime.UtcNow;

        [ForeignKey(nameof(TrainingType))]
        [Display(Name = "DevelopmentType", ResourceType = typeof(TrainingResource))]
        [JsonIgnore] // attributes prevent circular references
        public DevelopmentPlan? DevelopmentType { get; set; }

        public ICollection<TrainingApplicant> ApplicantList { get; set; } = new List<TrainingApplicant>();

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (TrainingEndDate < TrainingStartDate)
            {
                var localizer = validationContext.GetService(typeof(IStringLocalizer<TrainingResource>)) as IStringLocalizer<TrainingResource>;
                yield return new ValidationResult(
                    localizer?["EndDateBeforeStartDate"] ?? "End date must be after start date",
                    new[] { nameof(TrainingEndDate) });
            }
            if (TrainingStartDate < PostEndDate)
            {
                var localizer = validationContext.GetService(typeof(IStringLocalizer<TrainingResource>)) as IStringLocalizer<TrainingResource>;
                yield return new ValidationResult(
                    localizer?["PostEndDateBeforeStartDate"] ?? "Start date must be after Post End date",
                    new[] { nameof(TrainingEndDate) });
            }
        }
    }
}