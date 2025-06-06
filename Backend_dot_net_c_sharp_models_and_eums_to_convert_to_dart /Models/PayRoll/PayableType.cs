using PeerageHRIS.Enumeration.Payroll;
using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Time;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.PayRoll
{
    public class PayableType
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? Id { get; set; }
        [Required]
        [Display(Name = "Payable Type Name")]
        public string? TypeName { get; set; } = null!;
        [Required]
        [Display(Name = "Payable Type Description")]
        public string? TypeDescription { get; set; } = null!; 
        [Required]
        [Display(Name = "Frequency")]
        public PayFrequency Frequency { get; set; } = PayFrequency.Monthly; 
        [Required]
        [Display(Name = "Payable Type Is Active")]
        public bool IsActive { get; set; } = true;
        [Required]
        [Display(Name = "Payable Type Created By")]
        public string? CreatedBy { get; set; } = null!;
        [Required]
        [Display(Name = "Payable Type Created Date")]
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        [Display(Name = "Payable Type Modified By")]
        public string? ModifiedBy { get; set; } = null!;
        [Display(Name = "Payable Type Modified Date")]
        public DateTime? ModifiedDate { get; set; } = null;

        //navigation properties
        public ICollection<PayableEmployee>? PayableEmployees { get; set; } = null!;
    }
}
