using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Time
{
    public class AbsenceTracking
    {
        [Key]
        [Display(Name="Absence Id")]
        [Required]
        public int AbsenceId { get; set; }

        [Display(Name = "Employee")]
        [Required]
        public string? EmployeeId { get; set; }

        [Display(Name = "Absence Date")]
        [Required]
        [DataType(DataType.Date)]
        public DateTime AbsenceDate { get; set; }

        [Display(Name = "Absence Reason")]
        [Required]
        public string? AbsenceReason { get; set; }

        [Display(Name = "Note")]
        public string? Note {  get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }
    }
}
