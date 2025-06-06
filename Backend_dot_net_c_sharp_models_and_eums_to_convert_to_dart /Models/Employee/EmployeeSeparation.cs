// Ignore Spelling: Org

using Microsoft.EntityFrameworkCore.Metadata.Internal;
using PeerageHRIS.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;

namespace PeerageHRIS.Models.Employee
{
    public class EmployeeSeparation
    {
        [Key]
        [Display(Name = "ID")]
        public string? SeparationId { get; set; }
        [Display(Name = "Employee Id")]
        public string? EmployeeId { get; set; }
        [Display(Name = "Separation Category")]
        public SeparationType SeparationCategory { get; set; }
        [Display(Name = "Separation Reason")]
        public string? SeparationReason { get; set; }
        [Display(Name = "Recommendation")]
        public string? Recommendation { get; set; }
        [Display(Name = "Negative Employee")]
        [Column(TypeName = "nvarchar(450)")]
        public string? NegativeEmployee { get; set; }
        [Display(Name = "Positive Employee")]
        [Column(TypeName = "nvarchar(450)")]
        public string? PositiveEmployee { get; set; }
        [Display(Name = "Personal Notes")]
        public string? HRPersonalNotes { get; set; }
        [Display(Name = "Separation Request Date")]
        [DataType(DataType.Date)]
        public DateTime SeparationRequestDate { get; set; }
        [Display(Name = "Separation Approved Date")]
        [DataType(DataType.Date)]
        public DateTime SeparationApprovedDate { get; set; }
        [Display(Name = "Separation Type")]
        public string? SeparationType { get; set; }
        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        public EmployeeInfo? EmployeeList { get; set; }
    }
    public enum SeparationType
    {
        Retirement,
        Discipline,
        Personal,
        Performance,
        Contract
    }
}
