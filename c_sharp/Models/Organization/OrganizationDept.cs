using Microsoft.Build.Evaluation;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MimeKit;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Enumeration.Commission;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace PeerageHRIS.Models.Organization
{
    public class OrganizationDept
    {
        [Key]  
        [Display(Name = "Department Id")]
        public required string Id { get; set; }
        [Required]
        [Display(Name ="Department Name")]
        public string DepartmentName { get; set; } = string.Empty;
        [Display(Name = "Head Name")]
        public string? HeadId { get; set; } = string.Empty;
        [Display(Name = "Chart Name")]
        public string? StructureId { get; set; }
        [Display(Name = "Location")]
        public string? Location { get; set; }
        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }
        [Display(Name = "Update By")]
        public string? UpdatedBy { get; set; } = string.Empty;
        [Display(Name = "Update Date")]
        public DateTime? UpdateDate { get; set; }
        [Display(Name = "Chart Status")]
        public bool ChartStatus { get; set; } = true;
        public string? Icon { get; set; }
        [Display(Name = "Structure type")]
        //public ChartCategory ChartCategory { get; set; }
        public StructureType StructureType { get; set; } = StructureType.Department;

        [ForeignKey(nameof(HeadId))]
        public OrganizationDept? ParentCharts { get; set; } // Self-referencing for hierarchy
        [ForeignKey(nameof(StructureId))]
        public OrganizationChart? Structure { get; set; }
        public virtual ICollection<OrganizationDept> ChildDepartment { get; set; } = [];
        public virtual ICollection<OrganizationPosition> PositionList { get; set; } = [];
    }

}
