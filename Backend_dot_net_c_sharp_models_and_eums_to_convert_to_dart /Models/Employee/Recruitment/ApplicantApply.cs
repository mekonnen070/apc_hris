using Microsoft.CodeAnalysis.Elfie.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client; 
using PeerageHRIS.Extensions; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Recruitment
{
    public class ApplicantApply
    { 
        [Key]
        [Required] 
        public int ApplicantId { get; set; }
        [Required]
        [Display(Name = "Applied for")]
        public string AppliedTo { get; set; } = string.Empty;
        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; } = string.Empty;
        [Display(Name = "Middle Name")]
        public string MiddleName { get; set; } = string.Empty;
        [Required]
        [EmailAddress]
        public string Email { get; set; } = string.Empty;
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; } = string.Empty;
        [DataType(DataType.Date)]
        [Display(Name = "Date of Birth")]
        //[MinimumAge(18)] // Custom attribute
        public DateTime DateOfBirth { get; set; }
        [Required]
        public GenderList Gender { get; set; } = GenderList.Male;
        [Required]
        public string Address { get; set; } = string.Empty;
        [Required]
        public string Nationality { get; set; } = string.Empty;
        [Display(Name = "Resume File")]
        [NotMapped] // This property won't be stored in the database
        [DataType(DataType.Upload)]
        [AllowedExtensions([".pdf", ".doc", ".docx"])]
        [MaxFileSize(15 * 1024 * 1024)] // 15MB limit
        public IFormFile? ResumeFile { get; set; } 
        [Display(Name = "Attach Resume")]
        public string ResumePath { get; set; } = string.Empty;
        [StringLength(20)]
        [Display(Name = "Identification Number")]
        public string IdentificationNumber { get; set; } = string.Empty;
        [Display(Name = "Identification Type")]
        public IdentificationType IdentificationType { get; set; } = IdentificationType.NationalId;


        [Display(Name = "Interview Schedule Time")]
        public DateTime InterviewScheduledTime { get; set; }
        [Display(Name = "Interview Name")]
        public string InterviewerName { get; set; } = string.Empty;
        [Display(Name = "Interview FeedBack")]
        public string InterviewerFeedback { get; set; } = string.Empty;
        [Precision(18, 2)]
        [Display(Name = "Interview Score")]
        public decimal InterviewScore { get; set; }
        [Display(Name = "Exam. Schedule Time")]
        public DateTime ExamScheduledTime { get; set; }
        [Display(Name = "Examiner Name")]
        public string ExaminerName { get; set; } = string.Empty;
        [Display(Name = "Exam. FeedBack")]
        public string ExaminerFeedback { get; set; } = string.Empty;
        [Precision(18, 2)]
        [Display(Name = "Exam Score")]
        public decimal ExamScore { get; set; }

        [Display(Name = "Background Check")]
        public bool BackgroundCheck { get; set; } = false;
        [Display(Name = "Background Check Remark")]
        public string? BackgroundCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Reference Check")]
        public bool ReferenceCheck { get; set; } = false;
        [Display(Name = "Reference Check Remark")]
        public string? ReferenceCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Medical Check")]
        public bool MedicalCheck { get; set; } = false;
        [Display(Name = "Medical Check Remark")]
        public string? MedicalCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Final Check")]
        public bool FinalCheck { get; set; } = false;
        [Display(Name = "Final Check Remark")]
        public string? FinalCheckRemark { get; set; } = string.Empty;
        [Display(Name = "OnBoarding Check")]
        public bool IsOnBoarding { get; set; } = false;
        [Display(Name = "OnBoarding Check Remark")]
        public string? IsOnBoardingRemark { get; set; } = string.Empty;


        [Display(Name = "Entry By")]
        public DateTime EntryDate { get; set; } = DateTime.UtcNow;
        [Display(Name = "Entry Date")]
        public string EntryBy { get; set; } = string.Empty;
        public RecruitmentStatus Status { get; set; } = RecruitmentStatus.Submitted;

        [ForeignKey(nameof(AppliedTo))]
        public VacancyAnnouncement? AppliedPosition { get; set; } 
    }

    public enum RecruitmentStatus
    {
        Submitted=0, 
        Rejected=2,
        ShortListed=3,
        Failed=4,  
        WaitListed=6,
        Hired=7,
    }


    public enum IdentificationType
    {
        NationalId,
        Passport,
        DriverLicense,
        OrganozationId
    }
      public enum GenderList
    {
        Male,
        Female
    }
}
