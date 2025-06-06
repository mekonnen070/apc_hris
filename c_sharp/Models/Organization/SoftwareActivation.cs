using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    public class SoftwareActivation
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        [Column(TypeName = "nvarchar(450)")]
        [Display(Name = "Hardware Id")]
        public string? Hardware { get; set; }
        [Required]
        [Display(Name = "Commission")]
        public string? CompanyId { get; set; }
        [Column(TypeName = "nvarchar(450)")]
        [Display(Name = "Activation Id")]
        public string? ActivationId { get; set; }
        [Column(TypeName = "nvarchar(450)")]
        [Display(Name = "Serial Number")]
        public string? SerialNumber { get; set; }
        [Display(Name = "Verification Id")]
        public string? VerificationId { get; set; }
        [Display(Name = "Operating System")]
        public string? OsName { get; set; }
        [Display(Name = "Machine Name")]
        public string? MachineName { get; set; }

        [Display(Name = "Activation Status")]
        public string? ActivationStatus { get; set; } = "Authorized";
        [Display(Name = "Activation Date")]
        [DataType(DataType.Date)]
        public DateTime ActivationDate { get; set; }
        [Display(Name = "Device Locked")]
        public bool Locked { get; set; }
        ////[ForeignKey("CompanyId")]
        ////public OrganizationProfile? Commission { get; set; }
        //[ForeignKey(nameof(CompanyId))]
        //public OrganizationProfile? Commission { get; set; }
    }
}
