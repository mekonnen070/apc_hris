using Microsoft.EntityFrameworkCore; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Recruitment.Vm
{
    public class ApplicantInterviewVm
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Applied Job")]
        public int ApplicantId { get; set; }
        [Display(Name = "Interview Schedule Time")]
        public DateTime InterviewScheduledTime { get; set; }
        [Display(Name = "Interview Name")]
        public string InterviewerName { get; set; } = string.Empty;
        [Display(Name = "Interview FeedBack")]
        public string InterviewerFeedback { get; set; } = string.Empty;
        [Precision(18, 2)]
        [Display(Name = "Interview Score")]
        public decimal InterviewScore { get; set; } 
    }
}
