using Microsoft.CodeAnalysis.Differencing;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Payroll;
using PeerageHRIS.Extensions; 
using PeerageHRIS.Models.Employee.Retirement;
using PeerageHRIS.Models.Organization;
using PeerageHRIS.Models.PayRoll;
using PeerageHRIS.Models.Training;
using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Employee.Profiles
{
    public class EmployeeInfo
    {

        // Update the constructor or initialization logic to invoke the method and assign the calculated value.
        public EmployeeInfo()
        {
            CalculateEligibility();
        }

        [Key] 
        [Display(ResourceType = typeof(CommonResources), Name = "ID")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EmployeeIdRequired")]
        [Column(TypeName = "nvarchar(50)")]
        [StringLength(50, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EmployeeIdLength")] 
        public string EmployeeId { get; set; }//Guid.NewGuid().ToString();

        [Display(ResourceType = typeof(CommonResources), Name = "Title")]
        [StringLength(20, ErrorMessageResourceType = typeof(CommonResources), ErrorMessageResourceName = "TitleLength")]
        public string? Title { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "FirstName")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "FirstNameRequired")]
        [StringLength(100, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "FirstNameLength")]
        [RegularExpression(@"^[a-zA-Z\s\-']+$", ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "FirstNameInvalid")]
        public string? FirstName { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "FatherName")]
        [StringLength(100, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "FatherNameLength")]
        [RegularExpression(@"^[a-zA-Z\s\-']+$", ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "FatherNameInvalid")]
         public string? FatherName { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "GrandName")]
        [StringLength(100, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GrandNameLength")]
        [RegularExpression(@"^[a-zA-Z\s\-']+$", ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GrandNameInvalid")]
        public string? GrandName { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Gender")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GenderRequired")]
        //[RegularExpression("^(Male|Female|Other)$", ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GenderInvalid")]
        public Gender Gender { get; set; } 

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "BirthDate")]
        [DataType(DataType.Date)]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "BirthDateRequired")]
        [AgeValidation(18, 65, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "InvalIdEmployeeAge")]
        public DateTime BirthDate { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "PhotoFile")]
        [NotMapped]
        [DataType(DataType.Upload)]
        [AllowedExtensions([".jpg", ".jpeg", ".png"], ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhotoAllowedExtension")]
        [MaxFileSize(5 * 1024 * 1024, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhotoMaxSize")]
        public IFormFile? PhotoFile { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "PhotoPath")]
        [StringLength(255, ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhotoPathLength")]
        public string? PhotoUrl { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "MotherFullName")]
        [StringLength(150,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "MotherNameInvalid")]
        public string? MotherName { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Position")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PositionRequired")]
        public string? PositionId { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "ManagerId")]
        public string? ManagerId { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Address1")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "AddressRequired")]
        [StringLength(200,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "AddressInvalid")]
        public string? Address1 { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Address2")]
        [StringLength(200,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "AddressInvalid")]
        public string? Address2 { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "HouseNumber")]
        [StringLength(20,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "HouseNumberInvalid")]
        public string? HouseNumber { get; set; } 

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EmployeePhone")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhoneNumberRequired")]
        [StringLength(20,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhoneNumberInvalid")]
        [RegularExpression(@"^[0-9\-\+\(\)\s]+$",ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "PhoneNumberFormat")]
        [DataType(DataType.PhoneNumber)]
        public string? Phone { get; set; }   
        
        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EmployeeMobile")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "MobileNumberRequired")]
        [StringLength(20,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "MobileNumberInvalid")]
        [RegularExpression(@"^[0-9\-\+\(\)\s]+$",ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "MobileNumberFormat")]
        [DataType(DataType.PhoneNumber)]
        public string? Mobile { get; set; } 

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EmployeeEmail")]
        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EmailRequired")]
        [StringLength(100,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EmailInvalidLength")] 
        public string? Email { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Nationality")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "NationalityRequired")]
        //[StringLength(50,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "NationalityLength")]
        public Country Nationality { get; set; } = Country.Ethiopia;

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "BloodGroup")]
       // [StringLength(3,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "BloodGroupLength")]
        public BloodGroup BloodGroup { get; set; } = BloodGroup.Unknown;

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Religion")]
        public Religions Religion { get; set; } = Religions.Other;

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "MedicalStatus")]
       [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources),ErrorMessageResourceName = "MedicalStatusRequired")]
        public MedicalStatus MedicalStatus { get; set; } = MedicalStatus.Pending;

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "RetirementNumber")]
        [StringLength(50,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "RetirementLength")]
        public string? RetirementNumber { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "TINNumber")]
        [StringLength(13,ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "TinNumberLength")]
        [RegularExpression(@"^[0-9\-]+$",ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "TinInvalid")]
        public string? TIN { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "MaritalStatus")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "MaritalStatusRequired")]
        public MaritalStatus MaritalStatus { get; set; } = MaritalStatus.Single;
        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EmployementStatus")]
        public EmployementStatus EmployementStatus { get; set; } = EmployementStatus.Active;
        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "IsManager")]
        public bool IsManager { get; set; } = false;
        //[Display(ResourceType = typeof(EmployeeInfoResources), Name = "Cgpa")]
        //public Decimal Cgpa { get; set; } = 0.00m;

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EntryBy")]
        //[Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EntryByRequired")]
        public string? EntryBy { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "EntryDate")]
        //[Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "EntryDateRequired")]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        //====================================New Updates

        public RecuritmentType RecuritmentType { get; set; } = RecuritmentType.Military;
        public EmploymentType EmploymentType { get; set; } = EmploymentType.FullTime;
        [DataType(DataType.Date)]
        public DateTime HiredDate { get; set; } = PeerageConstant.CurrentTimeStamp;
        [DataType(DataType.Date)]
        public DateTime? RetirementEligibilityDate { get; set; } = null;  
         
        // Computed property for dropdown display
        [NotMapped]
        public string FullName => $"{FirstName} {FatherName} {GrandName}";
        // Navigation properties

        [ForeignKey(nameof(PositionId))]
        [JsonIgnore] // attributes prevent circular references
        public OrganizationPosition? Designations { get; set; }

        [ForeignKey(nameof(ManagerId))]
        [JsonIgnore] // attributes prevent circular references
        public EmployeeInfo? Manager { get; set; }
        [JsonIgnore] // attributes prevent circular references
        public ICollection<EmployeeInfo> Subordinates { get; set; } = [];
        public ICollection<EmploymentHistory> EmployementHistory { get; set; } = [];
        public ICollection<EmployeeContact> EmployeeContacts { get; set; } = [];
        public ICollection<EmployeeDependant> EmployeeDependants { get; set; } = [];
        public ICollection<EmployeeLeave> EmployeeLeaves { get; set; } = [];
        public ICollection<EmployeeExperience> EmployeeExperiences { get; set; } = [];
        public ICollection<EmployeeEducation> EmployeeEducations { get; set; } = []; 
        public ICollection<EmployeeSeparation> EmployeeSeparations { get; set; } = [];
        public ICollection<EmployeeSpouse> EmployeeSpouse { get; set; } = [];
        public ICollection<EmployeePerformance> Performances { get; set; } = [];
        public ICollection<RetirementInfo> RetirementDetails { get; set; } = [];
        public ICollection<TrainingApplicant> TrainingApplied { get; set; } = [];
        public ICollection<SkillMatrix> skillMatrices { get; set; } = [];

        //Payroll related
        public ICollection<DeductionEmployee> DeductionEmployees { get; set; } = [];
        public ICollection<PayableEmployee> payableEmployees { get; set; } = [];

        // Server-side rating calculation
        public void CalculateEligibility()
        {
            RetirementEligibilityDate = BirthDate.AddYears(65);
        } 
    } 
    
}