using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client; 
using PeerageHRIS.Models.Organization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Recruitment
{
    public class VacancyAnnouncement
    { 
        [Key]
        [Display(Name = "Ref. No")]
        [Required]
        public string RefNo { get; set; }=string.Empty;
        [Required]
        [Display(Name = "Post Date")]
        public DateTime PostDate { get; set; }
        [Required]
        [Display(Name ="Position Information")]
        public string PositionId {  get; set; }=string.Empty;
        [Required]
        [Display(Name ="Position Title")]
        public string PositionTitle {  get; set; }=string.Empty;
        [Required]
        [Display(Name ="Pay Grade")]
        public string PositionGrade { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Location")]
        public string Dutylocation { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Responsibilities")]
        public string Responsiblity { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Requirement")]
        public string PositionRequirement { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Education")]
        public string MiniEducation { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Application Procedure")]
        public string ApplicationProcedure { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Dead Line")]
        public DateTime PostDeadLine { get; set; }
        [Required]
        [Display(Name = "Contact Email")]
        [EmailAddress]
        public string ContactEmail { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Contact Phone")]
        [Phone]
        public string ContactPhone { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Post Status")]
        public PostStatus PostStatus { get; set; } = PostStatus.Vacant;
        [Required]
        [Display(Name = "Entry By")]
        public string EntryBy { get; set; } = string.Empty; [Required]
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; } 
        [Display(Name = "Update By")]
        public string UpdateBy { get; set; } = string.Empty; [Required]
        [Display(Name = "Update Date")]
        public DateTime UpdateDate { get; set; }
        //public bool IsPrinted { get; set; } = false;
        [Required]
        [Precision(18, 2)]
        [Display(Name = "No. Position")]
        public decimal NoPosition { get; set; }
        [Display(Name = "Grade Salary")] 
        [Column(TypeName = "decimal(18,2)")]
        public decimal GradeSalary { get; set; }


        [ForeignKey(nameof(PositionId))]
        public OrganizationPosition? Designation { get; set; }

        public ICollection<ApplicantApply> ApplicantList { get; set; } = [];
    }
    public enum PostStatus
    {
        Vacant,
        Rejected,
        Posted,
        OverDue,
        UnderReview, 
        Examination,
        Onboarding,
        Hired,
    }
}
