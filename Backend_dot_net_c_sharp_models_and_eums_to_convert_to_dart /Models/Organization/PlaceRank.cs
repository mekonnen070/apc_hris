using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.CodeAnalysis.Elfie.Diagnostics;
using PeerageHRIS.Enumeration.Locations;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Organization
{
    public class PlaceRank
    {
        [Key]
        [Required]
        [Display(Name = "Place Id")]
        public int PlaceId { get; set; }

        [Required]
        [Display(Name = "Zone Id")]
        public int ZoneId { get; set; }

        [ForeignKey(nameof(ZoneId))]
        [JsonIgnore]
        [ValidateNever]
        public ZoneRegistration? Zone { get; set; }

        [Required]
        [Display(Name = "Place Name")]
        public string? PlaceName { get; set; }

        [Required]
        [Display(Name = "Rank")]
        public PlaceRanks Rank { get; set; }
    }
}
