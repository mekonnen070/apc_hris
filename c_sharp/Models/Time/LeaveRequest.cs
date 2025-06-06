using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Organization;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class LeaveRequest
    {
        [Key] 
        [Required]
        [Display(Name = "Leave Request Id")]
        public int LeaveRequestId { get; set; }

        [Required]
        [Display(Name = "Leave Type")]
        public string? LeaveTypeId { get; set; }

        [Required]
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [Required]
        [Display(Name = "Start Date")]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        [Required]
        [Display(Name = "End Date")]
        [DataType(DataType.Date)]
        public DateTime EndDate { get; set; }

        [Display(Name = "Num. of Days")]
        public int NumOfDays { get; set; }
                
        [Display(Name = "Request Reason")]
        public string? RequestReason { get; set; }

        [Required]
        [Display(Name = "Request Date")]
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; } = PeerageConstant.CurrentTimeStamp;

        [Display(Name ="Request Status")]
        [DefaultValue(LeaveRequestStatus.Pending)]
        public LeaveRequestStatus? RequestStatus { get; set; } = LeaveRequestStatus.Pending;

        [Display(Name = "Approved By")]
        public string? ApprovedBy { get; set; }

        [Display(Name = "Rejected By")]
        public string? RejectedBy { get; set; }

        [Display(Name = "Comment")]
        public string? Comment { get; set; }

        [Display(Name = "Actioned Date")]
        [DataType(DataType.Date)]
        public DateTime? ActionedDate { get; set; }

        [ForeignKey(nameof(LeaveTypeId))]
        [JsonIgnore]
        [ValidateNever]
        public LeaveType? LeaveType { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }

    }
}
