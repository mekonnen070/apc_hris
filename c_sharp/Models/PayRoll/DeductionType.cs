using PeerageHRIS.Enumeration.Payroll;
using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Time;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.PayRoll
{
    public class DeductionType
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? Id { get; set; }
        [Required]
        [Display(Name = "Deduct Type Name")]
        public string? TypeName { get; set; } = null!;
        [Required]
        [Display(Name = "Deduct Type Description")]
        public string? TypeDescription { get; set; } = null!; 
        [Required]
        [Display(Name = "Frequency")]
        public PayFrequency Frequency { get; set; } = PayFrequency.Monthly; 
        [Required]
        [Display(Name = "Deduct Type Is Active")]
        public bool IsActive { get; set; } = true;
        [Required]
        [Display(Name = "Deduct Type Created By")]
        public string? CreatedBy { get; set; } = null!;
        [Required]
        [Display(Name = "Deduct Type Created Date")]
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        [Display(Name = "Deduct Type Modified By")]
        public string? ModifiedBy { get; set; } = null!;
        [Display(Name = "Deduct Type Modified Date")]
        public DateTime? ModifiedDate { get; set; } = null;

        //navigation properties
       public ICollection<DeductionEmployee>? DeductionEmployees { get; set; } = null!; 
    }
}
