using Microsoft.Build.Evaluation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MimeKit;
using PeerageHRIS.Enumeration.Commission;
using PeerageHRIS.Models.Employee;
using PeerageHRIS.Models.Employee.Profiles;
using PeerageHRIS.Models.Employee.Recruitment;
using PeerageHRIS.Models.Placement;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    public class OrganizationPosition
    {
        [Key]
        [Display(Name = "Id")]
        public string? DesignationId { get; set; } = Guid.NewGuid().ToString();
        [Required]
        [Display(Name = "Designation Name")]
        public string? DesignationName { get; set; } 
        [Display(Name = "Organization")]
        public string? Organization { get; set; } 
        [Required]
        [Display(Name = "Designation Level")]
        public string? levelId { get; set; } 
        [Required]
        [Display(Name = "Department")]
        public string? Department { get; set; }
        [Required]
        [Display(Name = "Minimum Education")]
        public string? MinEducation { get; set; }
        [Required]
        [Display(Name = "Minimum Experience(in Years)")]
        public int MinExperience { get; set; } = 0;
        [Required]
        [Display(Name = "Responsibility")]
        public string? Responsibility { get; set; }
        [Required]
        [Display(Name = "Requirement")]
        public string? Requirement { get; set; }
        [Display(Name = "Required Employee")]
        public int Required_Employee { get; set; }
        [Display(Name = "Current Employee")]
        public int Current_Employee { get; set; }
        [Display(Name = "Location")]
        public string Location { get; set; } = "Bahir Dar, Kebele 16";
        public bool Enabled { get; set; } = true;
        [Display(Name = "Management Type")]
        public ManagementType ManagementType { get; set; } = ManagementType.Designation;
        public StructureType StructureType { get; set; } = StructureType.Position;
        [Display(Name = "Entry By")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }

        [ForeignKey(nameof(MinEducation))]
        public EducationCategories? Education { get; set; }
        [ForeignKey(nameof(Department))]
        public OrganizationDept? DepartmentCharts { get; set; }
        [ForeignKey(nameof(levelId))]
        public OrganizationRank? DesignationLevels { get; set; }

        public ICollection<EmployeeInfo> Employees { get; set; } = [];
        public ICollection<VacancyAnnouncement> Announcements { get; set; } = [];
        public ICollection<EmployeeRecruitment> RecruitmentLists { get; set; } = [];
        public ICollection<PlacementAnnouncement> PlacementList { get; set; } = [];
    }
}

