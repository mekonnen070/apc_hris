using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Administration
{
    public class TaxRate
    {
        [Key]
        [Required]
        public string? TaxId { get; set; }
        [Column(TypeName = "nvarchar(450)")]
        public string? TaxName { get; set; }
        [Precision(18, 2)]
        public decimal Rate { get; set; }
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }
        public DateTime EntryDate { get; set; }

    }
}
