using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Time
{
    public class AttendanceInitiation
    {
        [Key]
        [Required]
        public int AttendanceInitiationId { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Initation Date")]
        public string? InitiationDate { get; set; }

        [Required]
        [Display(Name = "Is Initated")]
        public bool IsInitiated { get; set; }

        [Display (Name = "Initiated At")]
        [DataType(DataType.DateTime)]
        public DateTime? InitiatedAt { get; set; }

        [Display(Name = "Initiated By")]
        public string? InitiatedBy { get; set; }
    }
}
