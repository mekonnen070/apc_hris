using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.CodeAnalysis.Elfie.Diagnostics;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Placement
{
    public class PlacementApplicant
    {
        [Key]
        [Required]
        [Display(Name ="Applicant Id")]
        public int ApplicantId { get; set; }

        [Required]
        [Display(Name = "Announcement")]
        public int PAnnouncementId { get; set; }

        [ForeignKey(nameof(PAnnouncementId))]
        [JsonIgnore]
        [ValidateNever]
        public PlacementAnnouncement? Announcement { get; set; }

        [Required]
        [Display(Name = "Employee")]
        public string? EmployeeId { get; set; }

        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore]
        [ValidateNever]
        public EmployeeInfo? Employee { get; set; }

        [Display(Name = "Entry Date")]
        [DataType(DataType.Date)]
        public DateTime? EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp.Date;

        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }

        [Required]
        [Display(Name ="Rank / Title")]
        public PlacementTitles PoliceTitle {  get; set; }

        [Required]
        [Display(Name = "Status")]
        public ApplicantStatus ApplicantStatus { get; set; } = ApplicantStatus.Pending;
    }
}
