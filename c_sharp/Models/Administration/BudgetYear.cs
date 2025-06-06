using PeerageHRIS.Models.Employee;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Administration
{
    public class BudgetYear
    {
        [Key]
        [Required]
        [Display(Name = "Budget Id")]
        public string? BudgetId { get; set; }
        [Required]
        [Display(Name = "Fiscal Year")]
        public string? FiscalYear { get; set; }
        [Required]
        [Display(Name = "Budget Start Date")]
        [DataType(DataType.Date)]
        public DateTime BudgetStart { get; set; }
        [Required]
        [Display(Name = "Budget End Date")]
        [DataType(DataType.Date)]
        public DateTime BudgetEnd { get; set; }
        [Display(Name = "Created By")]
        public string? CreatedBy { get; set; }
        [Display(Name = "Create Date")]
        public DateTime CreatedDate { get; set; }
        [Display(Name = "Closed")]
        public bool IsClosed { get; set; }
        [Display(Name = "Closed By")]
        public string? ClosedBy { get; set; }
        [Display(Name = "Closed Date")]
        [DataType(DataType.Date)]
        public DateTime ClosedDate { get; set; }
        public ICollection<EmployeeLeave> Leaves { get; set; } = [];
        //public virtual ICollection<BudgetWeeks>? Weeks { get; set; }
        //public virtual ICollection<InventoryPurchaseRequest>? PurchaseRequests { get; set; }
        //public virtual ICollection<BScMasterBehavior>? Behaviors { get; set; }
        //public virtual ICollection<BScPerspective>? Perspectives { get; set; }
    }
}
