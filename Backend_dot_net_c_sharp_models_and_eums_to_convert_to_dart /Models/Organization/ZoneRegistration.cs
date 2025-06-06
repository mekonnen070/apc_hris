using PeerageHRIS.Enumeration.Locations;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Organization
{
    public class ZoneRegistration
    {
        [Key]
        [Required]
        [Display(Name = "Zone Id")]
        public int ZoneId { get; set; }
        [Required]
        [Display(Name = "Zone Name")]
        public string? ZoneName { get; set; }

        [Required]
        [Display(Name = "Region")]
        public EthiopianRegion Region { get; set; }
        
        [Display(Name = "Description")]
        public string? Description { get; set; }
    }
}
