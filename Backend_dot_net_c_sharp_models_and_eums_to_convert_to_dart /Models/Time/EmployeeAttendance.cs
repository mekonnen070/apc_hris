using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Employee.Profiles; 
using PeerageHRIS.Constants;
using PeerageHRIS.Extensions;
using PeerageHRIS.Resources.Models.Employee;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class EmployeeAttendance
    {
        [Key]
        [Display(Name = "AttendanceId")]
        [Required]
        public int AttendanceId { get; set; }

        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [Display(Name = "Date")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Attendance date is required")]
        public DateTime AttendanceDate { get; set; }

        [Display(Name = "Clock In")]
        [DataType(DataType.DateTime)]
        public DateTime? ClockIn { get; set; }

        [Display(Name = "Clock Out")]
        [DataType(DataType.DateTime)]
        public DateTime? ClockOut { get; set; }

        [Display(Name = "Status")]
        [Required(ErrorMessage = "Status is required")]
        public AttendanceStatus AttendanceStatus { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo?  Employee { get; set; }

        [NotMapped]
        [Display(Name = "Start")]
        [DataType(DataType.Date)]
        public DateTime? Start { get; set; }

        [NotMapped]
        [Display(Name = "End")]
        [DataType(DataType.Date)]
        public DateTime? End { get; set; }


    }
}
