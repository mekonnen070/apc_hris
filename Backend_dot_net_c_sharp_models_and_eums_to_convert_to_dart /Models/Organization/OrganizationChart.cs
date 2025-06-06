using Microsoft.Build.Evaluation;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MimeKit;
using PeerageHRIS.Enumeration.Commission;
using PeerageHRIS.Models.PayRoll;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace PeerageHRIS.Models.Organization
{ 
    public class OrganizationChart
    {
        [Key] 
        [Required]
        [Display(Name = "Chart Id")]
        public required string Id { get; set; }
        [Required]
        [Display(Name ="Chart Name")]
        public string ChartName { get; set; } = string.Empty;
        [Display(Name = "Parent Chart")]
        public string? ParentId { get; set; } = string.Empty;
        ////new Profile
        //[Display(Name = "CommissionId")]
        //public string? ProfileId { get; set; } = string.Empty;
        [Display(Name = "Location")]
        public string? Location { get; set; }
        [Display(Name = "Category Level")]
        public ChartCategory ChartCategory { get; set; }
        public StructureType StructureType { get; set; } = StructureType.Structure;
        [Display(Name = "Chart Status")]
        public bool ChartStatus { get; set; } = true;
        public string? Icon { get; set; }

        [Display(Name = "Entry By")]
        [Column(TypeName = "nvarchar(450)")]
        public string? EntryBy { get; set; }
        [Display(Name = "Entry Date")]
        public DateTime EntryDate { get; set; }
        [Display(Name = "Update By")]
        public string? UpdatedBy { get; set; } = string.Empty;
        [Display(Name = "Update Date")]
        public DateTime? UpdateDate { get; set; }

        [ForeignKey(nameof(ParentId))]
        public OrganizationChart? ParentCharts { get; set; } // Self-referencing for hierarchy
        //[ForeignKey(nameof(ProfileId))]
        //public OrganizationProfile? Organization { get; set; } 

        public  ICollection<OrganizationChart> ChildStructure { get; set; } = [];
        public  ICollection<OrganizationDept> DepartmentList { get; set; } = [];
        public  ICollection<OrganizationRank> RankList { get; set; } = [];
        public  ICollection<BudgetForCasting> BudgetForCastings { get; set; } = [];
    }

}
