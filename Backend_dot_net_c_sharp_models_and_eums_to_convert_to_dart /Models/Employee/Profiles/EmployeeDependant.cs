using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Locations;
using PeerageHRIS.Extensions;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Profiles
{
    public class EmployeeDependant
    {
        [Key]
        [Display(Name = "ID", ResourceType = typeof(EmployeeDependantResource))]
        public string? DependantId { get; set; }

        [Display(Name = "EmployeeId", ResourceType = typeof(EmployeeDependantResource))]
        public string? EmployeeId { get; set; }

        [Display(Name = "DependantFullName", ResourceType = typeof(EmployeeDependantResource))]
        [Required(ErrorMessageResourceName = "RequiredField", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public string? DependantFullName { get; set; }

        [Display(Name = "Relation", ResourceType = typeof(EmployeeDependantResource))]
        [Required(ErrorMessageResourceName = "RequiredField", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public RelationTypes Relation { get; set; }

        [Display(Name = "Gender", ResourceType = typeof(EmployeeDependantResource))]
        [Required(ErrorMessageResourceName = "RequiredField", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public Gender Gender { get; set; }

        [Display(Name = "BirthDate", ResourceType = typeof(EmployeeDependantResource))]
        [DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime BirthDate { get; set; }

        [Display(Name = "Occupation", ResourceType = typeof(EmployeeDependantResource))]
        public string? Occupation { get; set; }

        // Ethiopian Address Fields with Localization
        [Display(Name = "Region", ResourceType = typeof(EmployeeDependantResource))]
        [Required(ErrorMessageResourceName = "RequiredField", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public EthiopianRegion Region { get; set; }

        [Display(Name = "Zone", ResourceType = typeof(EmployeeDependantResource))]
        public string? Zone { get; set; }

        [Display(Name = "Woreda", ResourceType = typeof(EmployeeDependantResource))]
        public string? Woreda { get; set; }

        [Display(Name = "Kebele", ResourceType = typeof(EmployeeDependantResource))]
        public string? Kebele { get; set; }

        [Display(Name = "HouseNumber", ResourceType = typeof(EmployeeDependantResource))]
        public string? HouseNumber { get; set; }

        [Display(Name = "PhoneNumber", ResourceType = typeof(EmployeeDependantResource))]
        [Required(ErrorMessageResourceName = "RequiredField", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        [EthiopianPhone(ErrorMessageResourceName = "InvalidPhone", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public string? PhoneNumber { get; set; }

        [Display(Name = "AlternatePhoneNumber", ResourceType = typeof(EmployeeDependantResource))]
        [EthiopianPhone(ErrorMessageResourceName = "InvalidPhone", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public string? AlternatePhoneNumber { get; set; }

        [Display(Name = "Email", ResourceType = typeof(EmployeeDependantResource))]
        [EmailAddress(ErrorMessageResourceName = "InvalidEmail", ErrorMessageResourceType = typeof(EmployeeDependantResource))]
        public string? Email { get; set; }

        [Display(Name = "Enabled", ResourceType = typeof(EmployeeDependantResource))]
        public bool Enabled { get; set; } = true;

        [Display(Name = "EntryBy", ResourceType = typeof(EmployeeDependantResource))]
        public string? EntryBy { get; set; }

        [Display(Name = "EntryDate", ResourceType = typeof(EmployeeDependantResource))]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        public EmployeeInfo? Employee { get; set; }
    }
}