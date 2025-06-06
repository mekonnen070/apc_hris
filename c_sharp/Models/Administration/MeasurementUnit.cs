using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Administration
{
    public class MeasurementUnit
    {
        [Key]
        [Required]
        [Display(Name = "Uom Id")]
        public string? UOMId { get; set; }
        [Required]
        [Display(Name = "Uom Name")]
        [Column(TypeName = "nvarchar(450)")]
        public string? UOMName { get; set; }
        //public virtual ICollection<InventoryItem>? Items { get; set; }
    }
}
