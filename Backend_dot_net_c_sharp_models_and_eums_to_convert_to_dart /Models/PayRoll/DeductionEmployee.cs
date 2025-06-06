using PeerageHRIS.Enumeration.Payroll;
using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Time;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.PayRoll
{
    public class DeductionEmployee
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? Id { get; set; } 
        public string? EmployeeId { get; set; } = null!;
        [Required]
        [Display(Name = "Deduction Type ID")]
        public string? DeductionTypeId { get; set; } = null!;
        [Required]
        [Display(Name = "Deduction Amount")]
        public decimal Amount { get; set; } = 0.0m;
        [Required]
        [Display(Name = "Deduction Frequency")]
        public PayFrequency Frequency { get; set; } = PayFrequency.Monthly;
        [Required]
        [Display(Name = "Deduction Start Date")]
        public DateTime StartDate { get; set; } = DateTime.Now;
        [Display(Name = "Deduction End Date")]
        public DateTime? EndDate { get; set; } = null;
        [Required]
        [Display(Name = "Deduction Is Active")]
        public bool IsActive { get; set; } = true;
        [Required]
        [Display(Name = "Deduction Created By")]
        public string? CreatedBy { get; set; } = null!;
        [Required]
        [Display(Name = "Deduction Created Date")]
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        [Display(Name = "Deduction Modified By")]
        public DateTime LastUpdatedDate { get; set; }
        public string? ModifiedBy { get; set; } = null!;
        [Display(Name = "Deduction Modified Date")]
        public DateTime ModifiedDate { get; set; } = DateTime.Now;

        // Navigation properties
        [ForeignKey( nameof(EmployeeId))]
        public EmployeeInfo? Employee { get; set; } = null!;
        [ForeignKey(nameof(DeductionTypeId))]
        public DeductionType? DeductionType { get; set; } = null!;

    }
}
