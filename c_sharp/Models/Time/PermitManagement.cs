using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class PermitManagement
    {
        [Key]
        [Display(Name ="Permit Id")]
        [Required]
        public int PermitId {  get; set; }

        [Required]
        [Display(Name ="Employee")]
        public string? EmployeeId { get; set; }

        [Required]
        [Display(Name = "Permit Start")]
        public DateTime PermitStart { get; set; }

        [Required]
        [Display(Name = "Permit End")]
        public DateTime PermitEnd { get; set; }

        [Required]
        [Display(Name = "Request Date")]
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; }

        [Display(Name = "Permit Reason")]
        public string? PermitReason { get; set; }

        [Display(Name = "Permit Status")]
        [DefaultValue(PermitStatus.Pending)]
        public PermitStatus PermitStatus { get; set; } = PermitStatus.Pending;

        [Display(Name = "Approved By")]
        public string? ApprovedBy { get; set; }

        [Display(Name = "Approved By")]
        public string? RejectedBy {  get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }



    }
}
