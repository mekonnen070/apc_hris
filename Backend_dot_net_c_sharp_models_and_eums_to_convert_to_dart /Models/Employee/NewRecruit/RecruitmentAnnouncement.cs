using PeerageHRIS.Enumeration;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Employee.NewRecruit
{
    public class RecruitmentAnnouncement
    {
        [Key]
        [Required]
        [Display(Name ="Announcement Id")]
        public string? AnnouncementId { get; set; }

        [Required]
        [Display(Name = "Announcement Title")]
        public string? AnnouncementTitle { get; set; }

        [Required]
        [Display(Name = "Description")]
        public string? AnnouncementDescription { get; set; }

        [Required]
        [Display(Name = "Required Applicants")]
        public int RequiredApplicants { get; set; }

        [Required]
        [Display(Name = "Round")]
        public string? Round { get; set; }

        [Display(Name = "Created Date")]
        [Required]
        [DataType(DataType.Date)]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Created By")]
        public string? CreatedBy { get; set; }

        [Display(Name = "Expiry Date")]
        [Required]
        [DataType(DataType.Date)]
        public DateTime? ExpiryDate { get; set; }

        [Display(Name = "Status")]
        public AnnouncementStatus Status { get; set; } = AnnouncementStatus.Created;

        [Display(Name = "Posted Date")]
        [DataType(DataType.Date)]
        public DateTime? PostedDate { get; set; }

        [Display(Name = "Posted By")]
        public string? PostedBy { get; set; }
    }
}
