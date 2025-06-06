using PeerageHRIS.Enumeration.Payroll;
using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Time;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.PayRoll
{
    public class PayableEmployee
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? Id { get; set; } 
        public string? EmployeeId { get; set; } = null!;
        [Required]
        [Display(Name = "Payable Type ID")]
        public string? PayableTypeId { get; set; } = null!;
        [Required]
        [Display(Name = "Payable Amount")]
        public decimal Amount { get; set; } = 0.0m;
        [Required]
        [Display(Name = "Frequency")]
        public PayFrequency Frequency { get; set; } = PayFrequency.Monthly;
        [Required]
        [Display(Name = "Payable Start Date")]
        public DateTime StartDate { get; set; } = DateTime.Now;
        [Display(Name = "Payable End Date")]
        public DateTime? EndDate { get; set; } = null;
        [Required]
        [Display(Name = "Payable Is Active")]
        public bool IsActive { get; set; } = true;
        [Required]
        [Display(Name = "Payable Created By")]
        public string? CreatedBy { get; set; } = null!;
        [Required]
        [Display(Name = "Payable Created Date")]
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        [Display(Name = "Payable Modified By")]
        public DateTime LastUpdatedDate { get; set; }
        public string? ModifiedBy { get; set; } = null!;
        [Display(Name = "Payable Modified Date")]
        public DateTime ModifiedDate { get; set; } = DateTime.Now;

        // Navigation properties
        [ForeignKey( nameof(EmployeeId))]
        public EmployeeInfo? Employee { get; set; } = null!;
        [ForeignKey(nameof(PayableTypeId))]
        public DeductionType? DeductionType { get; set; } = null!;

    }
}
