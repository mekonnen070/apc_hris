using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Placement
{
    public class PlacementSelection
    {
        [Key]
        [Required]
        [Display(Name ="Id")]
        public int Id { get; set; }

        [Display(Name ="Applicant Id")]
        public int ApplicantId { get; set; }

        [ForeignKey(nameof(ApplicantId))]
        [JsonIgnore]
        [ValidateNever]
        public PlacementApplicant? Applicant { get; set; } // the applicant

        [Display(Name = "Announcement")]
        public int PAnnouncementId { get; set; } // the announcement

        // Selection Criteria one
        [Display(Name ="Not Punished with Sever Descipline")]
        public bool DisciplineStatus { get; set; }

        [Display(Name = "Discipline Description")]
        public string? DisciplineDescription { get; set; } = string.Empty;

        // Selection Criteria two
        [Display(Name = "Not equal to or less than the position held")]
        public bool PositionRelevance { get; set; }

        [Display(Name = "Position Description")]
        public string? PositionRelevanceDescription { get; set; } = string.Empty;

        
        [Display(Name = "Entery By")]
        public string? EntryBy { get; set; } = string.Empty;

        [Display(Name = "Entry Date")]
        [DataType(DataType.Date)]
        public DateTime EntryDate { get; set; } = PeerageConstant.CurrentTimeStamp.Date;

        [Display(Name ="Status")]
        public ApplicantStatus SelectionStatus { get; set; }
    }
}
