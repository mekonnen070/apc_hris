using Microsoft.AspNetCore.Mvc.ModelBinding.Validation; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class LeaveLedger
    {
        [Key]
        [Required]
        [Display(Name ="Leave Ledger Id")]
        public int LeaveLedgerId { get; set; }

        [Required]
        [Display(Name = "Leave Balance")]
        public int LeaveBalanceId { get; set; }

        [ForeignKey(nameof(LeaveBalanceId))]
        [JsonIgnore]
        [ValidateNever]
        public LeaveBalance? LeaveBalance { get; set; }

        [Display(Name = "Date")]
        [DataType(DataType.Date)]
        public DateTime? Date { get; set; }


        [Required]
        [Display(Name = "Total Days")]
        public int TotalDays { get; set; }

        [Required]
        [Display(Name = "Approved (Used) Days")]
        public int UsedDays { get; set; }


        [Required]
        [Display(Name = "Pending Days")]
        public int PendingDays { get; set; }

        [Required]
        [Display(Name = "Balance")]
        public int Balance { get; set; }

        [Display(Name = "Remark")]
        public string? Remark { get; set; }
    }
}
