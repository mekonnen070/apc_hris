using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Time
{
    public class LeaveTypes
    {
        [Key]
        [Display(Name = "Leave Type Id")]
        [Required]
        public int LeaveTypeId { get; set; }

        [Display(Name = "Leave Type Name")]
        [Required]
        public string? LeaveTypeName { get; set; }

        [Display(Name = "Is Paid")]
        [Required]
        public bool IsPaid { get; set; } = true;

        [Display(Name = "Description")]
        public string? Description { get; set; }

        [Display(Name = "Max Allowed Days")]
        [Required]
        [Range(0, 365)]
        public int MaximumDays { get; set; }
    }
}
