using PeerageHRIS.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    public class EducationCategories
    {
        [Key]
        [Display(Name = "Id")]
        [Required]
        [Column(TypeName = "nvarchar(50)")]
        [StringLength(50, ErrorMessage = "Education level cannot exceed 50 characters")]
        public string EducationId { get; set; } = string.Empty;
        [Required]
        [Display(Name = "Education Level")]
        public string? EducationLevel { get; set; }
        [Required]
        [Display(Name = "Education Name")]
        public string? EducationName { get; set; }
        [Required]
        [Display(Name = "Education Field")]
        public string? EducationField { get; set; }
        [Required]
        [Display(Name = "Education List")]
        public string? FieldList { get; set; }
        public bool Enabled { get; set; } = true;
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        public ICollection<OrganizationPosition> Designations { get; set; } = [];

        public ICollection<EmployeeEducation> Educations { get; set; } = [];
    }
}
