using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Training;

//using PeerageHRIS.Models.Commission;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Placement
{
    public class PlacementAnnouncement
    {
        [Key]
        [Required]
        [Display(Name = "Announcement Id")]
        public int AnnouncementId { get; set; }

        [Required]
        [Display(Name = "Announcement Title")]
        public string? AnnouncementTitle { get; set; }

        [Required]
        [Display(Name = "Location")]
        public string? Location { get; set; }

        [Required]
        [Display(Name = "Department")]
        public string? Department { get; set; }

        [Required]
        [Display(Name ="Position")]
        public string? Position { get; set; }

        //[ForeignKey(nameof(PositionId))]
        //[JsonIgnore]
        //[ValidateNever]
        //public CommissionDesignation? Position {  get; set; }

        [Required]
        [Display(Name = "Required Experience (years)")]
        public int RequiredExperience { get; set; }

        [Required]
        [Display(Name = "Required Education")]
        public PlacementEducation? RequiredEducation { get; set; }

        [Required]
        [Display(Name ="Required Applicants")]
        public int RequiredApplicants { get; set; }

        [Display(Name = "Created Date")]
        [DataType(DataType.Date)]
        public DateTime? CreatedDate { get; set; } = PeerageConstant.CurrentTimeStamp.Date;

        [Display(Name = "Created By")]
        public string? CreatedBy { get; set; }

        [Display(Name = "Expiry Date")]
        [DataType(DataType.Date)]
        public DateTime? ExpiryDate { get; set; }

        [Display(Name ="Budgeted")]
        public bool Budgeted { get; set; } = true;

        [Display(Name ="Status")]
        public ApplicantStatus AnnouncementStatus { get; set; } = ApplicantStatus.Pending;


    }
}
