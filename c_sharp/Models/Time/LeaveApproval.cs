using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class LeaveApproval
    {
        [Key] 
        [Required]
        [Display(Name ="Leave Approval Id")]
        public int LeaveApprovalId { get; set; }

        [Required]
        [Display(Name ="Leave Request")]
        public int RequestId { get; set; }

        [ForeignKey(nameof(RequestId))]
        [JsonIgnore]
        [ValidateNever]
        public LeaveRequest? LeaveRequest { get; set; }

        [Required]
        public string? Approver {  get; set; }

        [Required]
        [Display(Name ="Request Status")]
        public LeaveRequestStatus? Status { get; set; }

        [Required]
        [Display(Name = "Approval Date")]
        [DataType(DataType.Date)]
        public DateTime ApprovalDate { get; set; }

        [Display(Name ="Approver Comment")]
        public string? ApproverComment { get; set; }
    }
}
