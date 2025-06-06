using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Transfer
{
    public class TransferHistory
    {
        [Key]
        [Required]
        public int TransferHistoryId { get; set; }

        [Display(Name = "Date")]
        [DataType(DataType.Date)]
        public DateTime? Date { get; set; }

        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }

        [Required]
        [Display(Name ="Current Position")]
        public string? CurrentPosition { get; set; }

        [Required]
        [Display(Name = "Pending Position")]
        public string? PendingPosition { get; set; }

        [Required]
        [Display(Name = "Actual Position")]
        public string? ActualPosition { get; set; }

        [Display(Name = "Remark")]
        public string? Remark { get; set; }
    }
}
