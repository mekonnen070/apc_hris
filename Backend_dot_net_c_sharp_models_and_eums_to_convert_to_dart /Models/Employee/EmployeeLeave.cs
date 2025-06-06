// Ignore Spelling: CGPA

using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Models.Administration;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Organization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee
{
    public class EmployeeLeave
    {
        [Key]
        [Display(Name = "Id")]
        public string? LeaveId { get; set; }
        [Display(Name = "Budget")]
        public string? BudgetId { get; set; }
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }
        [Display(Name = "Leave Type")]
        public string? TypeId { get; set; }
        [Display(Name = "Leave Balance")]
        [Precision(18, 2)]
        public decimal LeaveBalance { get; set; }
        public bool Enabled { get; set; } = true;
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(BudgetId))]
        public BudgetYear? BudgetYear { get; set; }
        [ForeignKey(nameof(EmployeeId))]
        public EmployeeInfo? Employee { get; set; }
        [ForeignKey(nameof(TypeId))]
        public LeaveType? LeaveType { get; set; }

        public ICollection<EmployeeLeaveLedger> LeaveLeader { get; set; } = [];
    }
}
