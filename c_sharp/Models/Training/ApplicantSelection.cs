using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Training;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Training
{
    public class ApplicantSelection
    {
        // ID and Foreign Keys
        [Key]
        [Display(Name = "ID", ResourceType = typeof(TrainingResource))]
        public int? Id { get; set; }

        [Display(Name = "ApplicationId", ResourceType = typeof(TrainingResource))]
        public int ApplicationId { get; set; }

        [Display(Name = "ApplicantId", ResourceType = typeof(TrainingResource))]
        public string? ApplicantId { get; set; }

        [Display(Name = "TrainingId", ResourceType = typeof(TrainingResource))]
        public int TrainingId { get; set; }

        // Selection Criteria
        [Display(Name = "DisciplineStatus", ResourceType = typeof(TrainingResource))]
        public bool DisciplineStatus { get; set; }

        [Display(Name = "DisciplineDescription", ResourceType = typeof(TrainingResource))]
        //[StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? DisciplineDescription { get; set; } = string.Empty;

        [Display(Name = "TrainingStatus", ResourceType = typeof(TrainingResource))]
        public bool TrainingStatus { get; set; }

        [Display(Name = "TrainingDescription", ResourceType = typeof(TrainingResource))]
        //[StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? TrainingDescription { get; set; } = string.Empty;

        [Display(Name = "Experience", ResourceType = typeof(TrainingResource))]
        public bool Experience { get; set; }

        [Display(Name = "ExperienceDescription", ResourceType = typeof(TrainingResource))]
        //[StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? ExperienceDescription { get; set; } = string.Empty;

        [Display(Name = "RetirementStatus", ResourceType = typeof(TrainingResource))]
        public bool RetirementStatus { get; set; }

        [Display(Name = "RetirementDescription", ResourceType = typeof(TrainingResource))]
        //[StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? RetirementDescription { get; set; } = string.Empty;

        [Display(Name = "MedicalStatus", ResourceType = typeof(TrainingResource))]
        public bool MedicalStatus { get; set; }

        [Display(Name = "MedicalDescription", ResourceType = typeof(TrainingResource))]
        //[StringLength(500, ErrorMessageResourceName = "DescriptionLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? MedicalDescription { get; set; } = string.Empty;

        // Selection Status
        [Display(Name = "SelectStatus", ResourceType = typeof(TrainingResource))]
        public ApplicantStatus SelectedStatus { get; set; }

        // Audit Fields
        //[Required(ErrorMessageResourceName = "EntryByRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EnteredBy", ResourceType = typeof(TrainingResource))]
        [StringLength(100, ErrorMessageResourceName = "EntryByLength", ErrorMessageResourceType = typeof(TrainingResource))]
        public string? EntryBy { get; set; } = string.Empty;

        //[Required(ErrorMessageResourceName = "EntryDateRequired", ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "EntryDate", ResourceType = typeof(TrainingResource))]
        [DataType(DataType.DateTime)]
        public DateTime EntryDate { get; set; } = DateTime.UtcNow;

        // Navigation Properties
        [ForeignKey(nameof(ApplicationId))]
        [Display(Name = "Applicant", ResourceType = typeof(TrainingResource))]
        public TrainingApplicant? Applicant { get; set; }          
        public ICollection<ApplicantEvaluation> ApplicantEvaluation { get; set; } = new List<ApplicantEvaluation>();
    }
}