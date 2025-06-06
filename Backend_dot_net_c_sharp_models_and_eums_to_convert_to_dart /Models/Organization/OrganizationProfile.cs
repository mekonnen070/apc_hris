using PeerageHRIS.Enumeration.Commission;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    public class OrganizationProfile
    {
        [Key]
        [Required]
        public string? CommissionId { get; set; }
        [Required]
        [Display(Name = "Commission Name")]
        public string? CommissionName { get; set; }
        [Required]
        [Display(Name = "Commission Phone")]
        public string? CompanyPhone { get; set; }
        [Required]
        [Display(Name = "Commission TIN")]
        public string? CompanyTIN { get; set; }
        [Display(Name = "Commission VAT")]
        public string? CompanyVAT { get; set; }
        public string? Country { get; set; }
        public string? Region { get; set; }
        public string? Address { get; set; }
        public string? Email { get; set; }
        public StructureType StructureType { get; set; } = StructureType.Commission;
        [Display(Name = "Created By")]
        public string? CreatedBy { get; set; }
        [Display(Name = "Created Date")]
        public DateTime? CreatedDate { get; set; }
        [Display(Name = "Update By")]
        public string? UpdatedBy { get; set; }
        [Display(Name = "Update Date")]
        public DateTime? UpdateDate { get; set; }

        //public virtual ICollection<OrganizationChart> StructureList { get; set; } = [];
        //public virtual ICollection<SoftwareActivation> ActivationLists { get; set; } = [];
    }
}
