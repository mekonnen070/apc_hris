using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Retirement
{
    public class RetirementInfo
    {
        [Key]
        public int RetirementId { get; set; } 
        [ForeignKey("Employee")]
        public string? EmployeeId { get; set; }
        [Display(Name = "Employee Name")]
        public string? EmployeeName { get; set; }
        [Display(Name = "Eligibility Date")]
        [DataType(DataType.Date)]
        public DateTime? RetirementEligibilityDate { get; set; }
        [Display(Name = "Notice SubmittedBy ")]
        public string? NoticeSubmittedBy { get; set; }
        [Display(Name = "Notice Date")]
        [DataType(DataType.Date)]
        public DateTime? NoticeDate { get; set; }
        [Display(Name = "Notice Period (Days)")]
        public int NoticePeriodDays { get; set; } = 60; // Default notice period
        [Display(Name = "Proposed Retirement Date")]
        [DataType(DataType.Date)]
        public DateTime? ProposedRetirementDate { get; set; }
        [Display(Name = "Actual Retirement Date")]
        [DataType(DataType.Date)]
        public DateTime? RetirementDate { get; set; }
        [Display(Name = "Reason")]
        [StringLength(500)]
        public string? Reason { get; set; }
        public EmployementStatus EmployementStatus { get; set; } = EmployementStatus.Active;
        [Display(Name = "Approval Status")]
        public RetirementApprovalStatus ApprovalStatus { get; set; } = RetirementApprovalStatus.Pending;
        [Display(Name = "Approved By")]
        public string? ApprovedBy { get; set; }
        [Display(Name = "Approval Date")]
        [DataType(DataType.Date)]
        public DateTime? ApprovalDate { get; set; }
        [Display(Name = "Remarks")]
        [StringLength(1000)]
        public string? Remarks { get; set; }
        [Display(Name = "Entry Date")]
        [DataType(DataType.DateTime)]
        public DateTime? EntryDate { get; set; }
        [Display(Name = "Last Modified")]
        public DateTime LastModified { get; set; } = DateTime.UtcNow;
        [Display(Name = "Modified By")]
        public string? ModifiedBy { get; set; }

        // Navigation properties 
        [ForeignKey(nameof(EmployeeId))]
        public virtual EmployeeInfo? Employee { get; set; }
        public virtual ICollection<RetirementArchive>? RetirementDocuments { get; set; } 
    }
}