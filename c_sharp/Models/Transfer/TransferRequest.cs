using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Commission; 
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Transfer
{
    public class TransferRequest
    {
        [Key] 
        [Required]
        public int TransferRequestId { get; set; }

        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }

        [Display(Name = "From Department")]
        [Required]
        public string? FromDepartment { get; set; } // commission charts - Department & Location

        [Display(Name = "To Department")]
        [Required]
        public string? ToDepartment { get; set; }

        [Display(Name = "From Position")]
        [Required]
        public string? FromPosition { get; set; } // Designation - Position

        [Display(Name = "To Position")]
        [Required]
        public string? ToPosition { get; set; }

        [Display(Name = "From Chart Category")]
        public ChartCategory FromChartCategory { get; set; }

        [Display(Name = "To Chart Category")]
        public ChartCategory ToChartCategory { get; set; }

        [Display(Name = "Transfer Date")]
        [DataType(DataType.Date)]
        [Required]
        public DateTime TransferDate { get; set; }

        [Display(Name = "Transfer Reason")]
        public TransferReasons? TransferReason { get; set; }

        [Display(Name = "Approved By")]
        public string? ApprovedBy { get; set; }

        [Display(Name = "Approval Date")]
        [DataType(DataType.Date)]
        public DateTime? ApprovalDate { get; set; }

        [Display(Name = "Transfer Status")]
        [DefaultValue(TransferStatus.Pending)]
        public TransferStatus TransferStatus { get; set; } = TransferStatus.Pending;
    }
}
