// Ignore Spelling: CGPA

using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee
{
    public class RecruitmentApplicant
    {
        [Key]
        [Display(Name = "Id")]
        public string? ApplicantId { get; set; }
        [Display(Name = "Requisition")]
        public string? Requisition { get; set; }
        [Display(Name = "Applicant FullName")]
        public string? FullName { get; set; }
        [Display(Name = "Education")]
        public string? Education { get; set; }
        [Display(Name = "Cumulative GPA")]
        [Precision(18, 2)]
        public decimal CGPA { get; set; }
        [Display(Name = "Direct Experience")]
        public string? DirectExperience { get; set; }
        [Display(Name = "Indirect Experience")]
        public string? IndirectExperience { get; set; }
        [Display(Name = "Application Date")]
        [DataType(DataType.Date)]
        public DateTime ApplicantDate { get; set; }
        [Display(Name = "Applicant Status")]
        public Applicants ApplicantStatus { get; set; }
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }
        [ForeignKey("Requisition")]
        public EmployeeRecruitment? RecruitmentRequest { get; set; }
    }
    public enum Applicants
    {
        Registered,
        Selected,
        Approved,
        Failled,
        Rejected,
    }
}
