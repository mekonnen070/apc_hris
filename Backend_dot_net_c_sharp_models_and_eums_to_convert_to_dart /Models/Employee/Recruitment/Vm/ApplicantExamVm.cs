using Microsoft.EntityFrameworkCore; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Recruitment.Vm
{
    public class ApplicantExamVm
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Applied Job")]
        public int ApplicantId { get; set; } 
        [Display(Name = "Exam. Schedule Time")] 
        public DateTime ExamScheduledTime { get; set; }
        [Display(Name = "Examiner Name")]
        public string ExaminerName { get; set; } = string.Empty;
        [Display(Name = "Exam. FeedBack")]
        public string ExaminerFeedback { get; set; } = string.Empty;
        [Precision(18, 2)]
        [Display(Name = "Exam Score")]
        public decimal ExamScore { get; set; }
         
    }
}
