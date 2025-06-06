using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Profiles
{ 
    public class EmployeeContact
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)] // Auto-generate ID
        [Display(Name = "ID", ResourceType = typeof(EmployeeContactResources))]
        public string? ContactId { get; set; }

        [Required(ErrorMessageResourceName = "EmployeeRequired", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        [Display(Name = "Employee", ResourceType = typeof(EmployeeContactResources))]
        public string? EmployeeId { get; set; }

        [Required(ErrorMessageResourceName = "FullNameRequired", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        [Display(Name = "FullName", ResourceType = typeof(EmployeeContactResources))]
        [StringLength(100, MinimumLength = 2, ErrorMessageResourceName = "FullNameLength", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? FullName { get; set; }

        [Required(ErrorMessageResourceName = "RelationshipRequired", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        [Display(Name = "Relationship", ResourceType = typeof(EmployeeContactResources))]
        public RelationTypes Relationship { get; set; }

        [Display(Name = "Address", ResourceType = typeof(EmployeeContactResources))]
        [DataType(DataType.MultilineText)]
         public string? Address { get; set; }

        [Required(ErrorMessageResourceName = "PhoneRequired", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        [Display(Name = "Phone", ResourceType = typeof(EmployeeContactResources))]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^(\+251|0)[1-59]\d{8}$", ErrorMessageResourceName = "InvalidPhoneFormat", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? Phone { get; set; }

        [Display(Name = "Mobile", ResourceType = typeof(EmployeeContactResources))]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^(\+251|0)[9]\d{8}$", ErrorMessageResourceName = "InvalidMobileFormat", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? Mobile { get; set; }

        [Display(Name = "Email", ResourceType = typeof(EmployeeContactResources))]
        [DataType(DataType.EmailAddress)]
        //[EmailAddress(ErrorMessageResourceName = "InvalidEmailFormat", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        [StringLength(100, ErrorMessageResourceName = "EmailTooLong", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? Email { get; set; }

        [Display(Name = "IsPrimary", ResourceType = typeof(EmployeeContactResources))]
        public bool IsPrimary { get; set; }

        [Display(Name = "IsActive", ResourceType = typeof(EmployeeContactResources))]
        public bool IsActive { get; set; } = true;

        [Display(Name = "CreatedBy", ResourceType = typeof(EmployeeContactResources))]
        [StringLength(50, ErrorMessageResourceName = "CreatedByTooLong", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? CreatedBy { get; set; }

        [Display(Name = "CreatedDate", ResourceType = typeof(EmployeeContactResources))]
        public DateTime CreatedDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        [Display(Name = "ModifiedBy", ResourceType = typeof(EmployeeContactResources))]
        [StringLength(50, ErrorMessageResourceName = "ModifiedByTooLong", ErrorMessageResourceType = typeof(EmployeeContactResources))]
        public string? ModifiedBy { get; set; }

        [Display(Name = "ModifiedDate", ResourceType = typeof(EmployeeContactResources))]
        public DateTime? ModifiedDate { get; set; }

        // Navigation property
        [ForeignKey(nameof(EmployeeId))] // Better navigation clarity
        public EmployeeInfo? Employee { get; set; }
    }
}