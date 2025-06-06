using Microsoft.EntityFrameworkCore; 
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Recruitment.Vm
{
    public class ApplicantCheckListVm
    {
        [Key]
        [Required]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Applied Job")]
        public int ApplicantId { get; set; } 

        [Display(Name = "Background Check")]
        public bool BackgroundCheck { get; set; } = false;
        [Display(Name = "Background Check Remark")]
        public string BackgroundCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Reference Check")]
        public bool ReferenceCheck { get; set; } = false;
        [Display(Name = "Reference Check Remark")]
        public string ReferenceCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Medical Check")]
        public bool MedicalCheck { get; set; } = false;
        [Display(Name = "Medical Check Remark")]
        public string MedicalCheckRemark { get; set; } = string.Empty;
        [Display(Name = "Final Check")]
        public bool FinalCheck { get; set; } = false;
        [Display(Name = "Final Check Remark")]
        public string FinalCheckRemark { get; set; } = string.Empty;
        //[Display(Name = "OnBoarding Check")]
        //public bool IsOnBoarding { get; set; } = false;
        //[Display(Name = "OnBoarding Check Remark")]
        //public bool IsOnBoardingRemark { get; set; } = false;
    }
}
