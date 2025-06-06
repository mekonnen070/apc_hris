// Ignore Spelling: CGPA

using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee
{
    public class EmployeeLeaveLedger
    {
        [Key]
        [Display(Name = "Ledger Id")]
        public string? LedgerId { get; set; }
        [Display(Name = "Budget")]
        public string? BudgetId { get; set; }
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }
        [Display(Name = "Leave")]
        public string? LeaveId { get; set; }
        [Display(Name = "Leave Request")]
        [Precision(18, 2)]
        public decimal LeaveRequest { get; set; }
        [Display(Name = "Verified By")]
        public string? VerifiedBy { get; set; }
        [Display(Name = "Verified Quantity")]
        [Precision(18, 2)]
        public decimal VerifiedQuantity { get; set; }
        [Display(Name = "Verify Date")]
        [DataType(DataType.Date)]
        public DateTime VerifyDate { get; set; }
        [Display(Name = "Approved By")]
        public string? ApprovedBy { get; set; }
        [Display(Name = "Approved Date")]
        [DataType(DataType.Date)]
        public DateTime ApproveDate { get; set; }
        [Display(Name = "Begin Balance")]
        [Precision(18, 2)]
        public decimal BeginBalance { get; set; }
        [Display(Name = "Approved Quantity")]
        [Precision(18, 2)]
        public decimal ApprovedQuantity { get; set; }
        [Display(Name = "End Balance")]
        [Precision(18, 2)]
        public decimal EndBalance { get; set; }
        [Display(Name = "Leave Start")]
        [DataType(DataType.Date)]
        public DateTime LeaveStart { get; set; }
        [Display(Name = "Leave End")]
        [DataType(DataType.Date)]
        public DateTime LeaveEnd { get; set; }
        [Display(Name = "Leave Notes")]
        public string? LeaveNotes { get; set; }
        [Display(Name = "Leave Status")]
        public LeaveStatus Status { get; set; }
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        //[ForeignKey(nameof(BudgetId))]
        //public BudgetYear? BudgetYear { get; set; }
        //[ForeignKey(nameof(EmployeeId))]
        //public Employee? employee { get; set; }
        [ForeignKey(nameof(LeaveId))]
        public EmployeeLeave? EmployeeLeave { get; set; }
    }
    public enum LeaveStatus
    {
        Request,
        Verified,
        Approved,
        Rejected
    }
}
