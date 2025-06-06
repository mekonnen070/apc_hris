using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Enumeration;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Employee.NewRecruit
{
    public class RecruitInfo
    {
        [Key]
        [Required]
        [Display(Name ="Recruit Id")]
        public string? RecruitId { get; set; }

        [Required]
        [Display(Name = "Announcement")]
        public string? AnnouncementId { get; set; }

        [ForeignKey(nameof(AnnouncementId))]
        [JsonIgnore]
        [ValidateNever]
        public RecruitmentAnnouncement? Announcement { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string? FirstName { get; set; }

        [Required]
        [Display(Name = "Father Name")]
        public string? FatherName { get; set; }

        [Display(Name = "Grand Father Name")]
        public string? GrandName { get; set; }

        [Required]
        [Display(Name = "Gender")]
        public Gender Gender { get; set; }

        [Required]
        [Display(Name = "Birth Date")]
        [DataType(DataType.Date)]
        public DateTime BirthDate { get; set; }

        [Display(Name = "Mother Full Name")]
        public string? MotherName { get; set; }

        [Required]
        [Display(Name = "Mobile Number")]
        [DataType(DataType.PhoneNumber)]
        public string? Mobile { get; set; }

        [Display(Name = "Email")]
        public string? Email { get; set; }

        [Display(Name = "Nationality")]
        public Country Nationality { get; set; } = Country.Ethiopia;

        // Computed property for dropdown display
        [NotMapped]
        [Display(Name ="Full Name")]
        public string FullName => $"{FirstName} {FatherName} {GrandName}";

    }
}
