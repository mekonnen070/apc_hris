using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc.Localization;
using Microsoft.Extensions.Localization;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Resources.Models.Employee.Profiles;

namespace PeerageHRIS.Models.Employee.Profiles
{ 
    public class EmployeeSpouse
    {
        [Key]
        [Display(Name = "SpouseId", ResourceType = typeof(EmployeeSpouseResources))]
        [MaxLength(36)] // Appropriate length for GUID
        public string SpouseId { get; set; }// = Guid.NewGuid().ToString();

        [Required(ErrorMessageResourceName = "TitleRequired", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [Display(Name = "Title", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(50, ErrorMessageResourceName = "TitleLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string Title { get; set; }

        [Required(ErrorMessageResourceName = "EmployeeRequired", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [Display(Name = "EmployeeName", ResourceType = typeof(EmployeeSpouseResources))]
        public string EmployeeId { get; set; }

        [Required(ErrorMessageResourceName = "SpouseNameRequired", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [Display(Name = "SpouseFullName", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(100, ErrorMessageResourceName = "SpouseNameLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string SpouseFullName { get; set; }

        [Display(ResourceType = typeof(EmployeeInfoResources), Name = "Gender")]
        [Required(ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GenderRequired")]
        //[RegularExpression("^(Male|Female|Other)$", ErrorMessageResourceType = typeof(EmployeeInfoResources), ErrorMessageResourceName = "GenderInvalid")]
        public Gender Gender { get; set; }

        [Required(ErrorMessageResourceName = "BirthDateRequired", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [Display(Name = "SpouseBirthDate", ResourceType = typeof(EmployeeSpouseResources))]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime SpouseBirthDate { get; set; }

        [Display(Name = "SpousePhone", ResourceType = typeof(EmployeeSpouseResources))]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\+?[0-9\s\-\(\)]{10,20}$",ErrorMessageResourceName = "InvalidPhoneFormat",ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string SpousePhone { get; set; }

        [Display(Name = "SpouseOccupation", ResourceType = typeof(EmployeeSpouseResources))]
        //[StringLength(100, ErrorMessageResourceName = "OccupationLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string SpouseOccupation { get; set; }

        [Display(Name = "MotherName", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(100, ErrorMessageResourceName = "MotherNameLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string MotherName { get; set; }

        [Required(ErrorMessageResourceName = "AddressRequired", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [Display(Name = "Address", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(200, ErrorMessageResourceName = "AddressLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string Address { get; set; }

        [Display(Name = "AnniversaryDate", ResourceType = typeof(EmployeeSpouseResources))]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime AnniversaryDate { get; set; }

        [Display(Name = "RetirementNumber", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(20, ErrorMessageResourceName = "RetirementNumberLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string RetirementNumber { get; set; }

        [Display(Name = "TIN", ResourceType = typeof(EmployeeSpouseResources))]
        [StringLength(20, ErrorMessageResourceName = "TINLength", ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        [RegularExpression(@"^[0-9\-]+$",ErrorMessageResourceName = "InvalidTINFormat",ErrorMessageResourceType = typeof(EmployeeSpouseResources))]
        public string TIN { get; set; }

        // Navigation property
        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore] // attributes prevent circular references
        public EmployeeInfo Employee { get; set; }

        // Constructor for initialization
        public EmployeeSpouse()
        {
            SpouseBirthDate = DateTime.Now.AddYears(-30); // Default age 30
            AnniversaryDate = DateTime.Now.AddYears(-5); // Default 5 years ago
        }
    }
}