// Ignore Spelling: Org

using Microsoft.EntityFrameworkCore.Metadata.Internal; 
using PeerageHRIS.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Globalization;
using System.IO;

namespace PeerageHRIS.Models.Employee
{
    public class EmploymentHistory
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? PositionId { get; set; }
        [Required]
        [Display(Name = "Designation Name")]
        public string? Designation { get; set; }
        [Required]
        [Display(Name = "Employee Name")]
        public string? Employee { get; set; }
        [Required]
        [Display(Name = "Job Level")]
        public string? BaseJobLevel { get; set; }
        [Required]
        [Display(Name = "Job Rank")]
        public string? JobRank { get; set; }
        [Required]
        [Display(Name = "Employment Category")]
        public string? EmploymentCategory { get; set; }
        [Display(Name = "Over Time Allowed")]
        public bool OvertimeAllowed { get; set; }
        [Display(Name = "Uniform Required")]
        public bool UniformRequired { get; set; }
        [Display(Name = "Join Option")]
        public string? JoinOption { get; set; }
        [Display(Name = "Join Reference")]
        public string? JoinReference { get; set; }
        [Display(Name = "Designation Status")]
        public string? DesignationStatus { get; set; }
        [Display(Name = "Employment Status")]
        public string? EmploymentStatus { get; set; }
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(Employee))]
        public EmployeeInfo? Employees { get; set; } 
    }
}
