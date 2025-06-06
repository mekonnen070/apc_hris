using Microsoft.AspNetCore.Components.Forms;
using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Training;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Training
{

    public class TrainingApplicant
    {
        [Key]
        [Display(Name = "ID", ResourceType = typeof(TrainingResource))]
        public int Id { get; set; }

        [Required(ErrorMessageResourceName = "ApplicantId_Required",ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "ApplicantId", ResourceType = typeof(TrainingResource))]
        public string ApplicantId { get; set; }

        [Required(ErrorMessageResourceName = "AppliedFor_Required",  ErrorMessageResourceType = typeof(TrainingResource))]
        [Display(Name = "AppliedFor", ResourceType = typeof(TrainingResource))]
        public int AppliedFor { get; set; }

        [Display(Name = "ApplicantStatus", ResourceType = typeof(TrainingResource))]
        public ApplicantStatus ApplicantStatus { get; set; } = ApplicantStatus.Pending;
        //[Display(ResourceType = typeof(TrainingResource), Name = "Cgpa")]
        //public Decimal Cgpa { get; set; } = 0.00m;

        [Display(ResourceType = typeof(TrainingResource), Name = "Cgpa")]
        [Range(0.00, 4.00, ErrorMessageResourceType = typeof(TrainingResource), ErrorMessageResourceName = "CgpaRangeError")]
        [DisplayFormat(DataFormatString = "{0:0.00}", ApplyFormatInEditMode = true)]
        [RegularExpression(@"^\d\.\d{2}$|^[0-4]\.\d{2}$", ErrorMessageResourceType = typeof(TrainingResource), ErrorMessageResourceName = "CgpaFormatError")]
        [Precision(18, 2)] // Ensure precision for currency values
        public decimal Cgpa { get; set; } = 0.00m;

        [Display(ResourceType = typeof(TrainingResource), Name = "Age")]
        [Range(18, 70, ErrorMessageResourceType = typeof(TrainingResource), ErrorMessageResourceName = "AgeRangeError")]
        [Required(ErrorMessageResourceType = typeof(TrainingResource), ErrorMessageResourceName = "AgeRequiredError")] 
        public int Age { get; set; }

        [Display(Name = "ApplicantEntryBy", ResourceType = typeof(TrainingResource))]
        public string? ApplicantEntryBy { get; set; }
         
        [DataType(DataType.DateTime)]
        [Display(Name = "ApplicantEntryDate", ResourceType = typeof(TrainingResource))]
        public DateTime ApplicantEntryDate { get; set; }

        [ForeignKey(nameof(ApplicantId))]
        [Display(Name = "Employee", ResourceType = typeof(TrainingResource))]
        public EmployeeInfo? Employee { get; set; }

        [ForeignKey(nameof(AppliedFor))]
        [Display(Name = "Training", ResourceType = typeof(TrainingResource))]
        public ManageTraining? Training { get; set; }

        public ICollection<ApplicantSelection> ApplicantSelections { get; set; } = new List<ApplicantSelection>();
    }
}