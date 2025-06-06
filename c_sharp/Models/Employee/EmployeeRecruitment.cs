// Ignore Spelling: Org
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using PeerageHRIS.Models.Organization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee
{
    public class EmployeeRecruitment
    {
        [Key]
        [Display(Name = "ID")]
        public string? RequisitionId { get; set; }
        [Display(Name = "Designation Name")]
        [Column(TypeName = "nvarchar(450)")]
        public string? Designation { get; set; }
        [Display(Name = "Employment Type")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EmploymentType { get; set; }
        [Display(Name = "Request Type")]
        [Column(TypeName = "nvarchar(450)")]
        public string? RequestType { get; set; }
        [Display(Name = "Request Quantity")]
        public int RequestQuantity { get; set; }
        [Display(Name = "Request By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? RequestBy { get; set; }
        [Display(Name = "Request Date")]
        [DataType(DataType.Date)]
        public DateTime RequestDate { get; set; }
        [Display(Name = "Approved Quantity")]
        public int ApprovedQuantity { get; set; }
        [Display(Name = "Approved By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? ApprovedBy { get; set; }
        [Display(Name = "Approved Date")]
        [DataType(DataType.Date)]
        public DateTime ApprovedDate { get; set; }
        [Display(Name = "Processed Quantity")]
        public int ProcessedQuantity { get; set; }
        [Display(Name = "Processed By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? ProcessedBy { get; set; }
        [Display(Name = "Processed Date")]
        [DataType(DataType.Date)]
        public DateTime ProcessedDate { get; set; }
        [Display(Name = "Post Start Date")]
        [DataType(DataType.Date)]
        public DateTime PostStartDate { get; set; }
        [Display(Name = "Post End Date")]
        [DataType(DataType.Date)]
        public DateTime PostEndDate { get; set; }
        [Display(Name = "Employment Status")]
        public string? EmploymentStatus { get; set; }
        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(Designation))]
        public OrganizationPosition? Designations { get; set; } 
        public ICollection<RecruitmentApplicant> Applicants { get; set; } = [];
    }
}
