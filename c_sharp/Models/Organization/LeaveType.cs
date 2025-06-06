using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Time;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    public class LeaveType
    {
        [Key]
        [Required]
        [Display(Name = "ID")]
        public string? TypeId { get; set; }

        [Required]
        [Display(Name = "Leave Type")]
        [Column(TypeName = "nvarchar(450)")]
        public string? TypeName { get; set; }
        
        [Required]
        [Display(Name = "Minimum Leave")]
        public int MinimumLeave { get; set; }

        [Required]
        [Display(Name = "Increment")]
        public int Increment { get; set; } = 0;

        [Required]
        [Display(Name = "Incrementing By-Year(s)")]
        public int IncrementingByYear { get; set; } = 0;

        [Required]
        [Display(Name = "Maximum Leave")]
        public int MaximumLeave { get; set; }

        public bool Enabled { get; set; } = true;

        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }

        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }
        public ICollection<LeaveRequest> Leaves { get; set; } = [];
    }
}
