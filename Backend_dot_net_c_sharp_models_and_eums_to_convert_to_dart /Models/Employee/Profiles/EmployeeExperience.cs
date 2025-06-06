// Ignore Spelling: CGPA
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Recruitment;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Employee.Profiles
{
    public class EmployeeExperience
    {
        [Key]
        [Display(Name = "ID")]
        public string? ExperienceId { get; set; }
        [Display(Name = "Employee Name")]
        public string? EmployeeId { get; set; }
        [Display(Name = "Organization")]
        public string? Organization { get; set; }
        [Display(Name = "Organization Type")]
        public Organizations OrganizationType { get; set; }
        [Display(Name = "Position")]
        public string? Position { get; set; }
        public string Responsibilities { get; set; } = string.Empty;
        [Display(Name = "Proficiency")]
        public ProficiencyLevel ProficiencyLevel { get; set; } = ProficiencyLevel.Beginner;
        [Display(Name = "Join Date")]
        [DataType(DataType.Date)]
        public DateTime JoinDate { get; set; }
        [Display(Name = "Separation Date")]
        [DataType(DataType.Date)]
        public DateTime SeparationDate { get; set; }
        [Display(Name = "Separation Notes")]
        public string? SeparationNotes { get; set; }
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore] // attributes prevent circular references
        public EmployeeInfo? Employee { get; set; }
    }
}
