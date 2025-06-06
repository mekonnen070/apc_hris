using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Organization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class LeaveBalance
    {
        [Key]
        [Required]
        public int LeaveBalanceId { get; set; }

        [Required]
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }

        [Required]
        [Display(Name = "Leave Type")]
        public string? LeaveTypeId { get; set; }

        [ForeignKey(nameof(LeaveTypeId))]
        [JsonIgnore]
        [ValidateNever]
        public LeaveType? LeaveType { get; set; }

        [Required]
        [Display(Name = "Budget Year")]
        public int BudgetYear { get; set; }

        [Required]
        [Display(Name = "Eth. Budget Year")]
        public int EthBudgetYr { get; set; }

        [Required]
        [Display(Name = "Total Days")]
        public int TotalDays { get; set; }

        [Required]
        [Display(Name = "Used Days")]
        public int UsedDays { get; set; }

        [Required]
        [Display(Name = "Balance")]
        public int Balance { get; set; }

        [Display(Name = "Updated Date")]
        [DataType(DataType.Date)]
        public DateTime? UpdatedDate { get; set; }
    }
}
