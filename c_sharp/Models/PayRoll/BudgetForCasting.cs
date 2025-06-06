using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using PeerageHRIS.Constants;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Organization;

namespace PeerageHRIS.Models.PayRoll
{
    public class BudgetForCasting
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BudgetId { get; set; }
        public string? CompanyId { get; set; }
        [Required(ErrorMessage = "Budget name is required")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "Budget name must be between 3 and 100 characters")]
        [Display(Name = "Budget Name")]
        public string BudgetName { get; set; } = string.Empty;
        [Required(ErrorMessage = "Start date is required")]
        [DataType(DataType.Date)]
        [Display(Name = "Start Date")] 
        public DateTime StartDate { get; set; } = DateTime.Today;
        [Required(ErrorMessage = "End date is required")]
        [DataType(DataType.Date)]
        [Display(Name = "End Date")] 
        [DateGreaterThan("StartDate", ErrorMessage = "End date must be after start date")]
        public DateTime EndDate { get; set; } = DateTime.Today.AddMonths(1);
        [Required(ErrorMessage = "Department is required")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Department name must be between 2 and 50 characters")]
        [Display(Name = "Department")]
        public string Department { get; set; } = string.Empty;
        [Required(ErrorMessage = "Position is required")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Position must be between 2 and 50 characters")]
        [Display(Name = "Position")]
        public string Position { get; set; } = string.Empty;
        [Required(ErrorMessage = "Forecast amount is required")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Forecast amount must be greater than 0")]
        [DataType(DataType.Currency)]
        [Display(Name = "Forecast Amount")]
        [Column(TypeName = "decimal(18, 2)")]
        public decimal ForCastAmount { get; set; }
        [Required(ErrorMessage = "Budget amount is required")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Budget amount must be greater than 0")]
        [DataType(DataType.Currency)]
        [Display(Name = "Budget Amount")]
        [Column(TypeName = "decimal(18, 2)")]
        public decimal BudgetAmount { get; set; }
        [Required(ErrorMessage = "Currency is required")]
        [Display(Name = "Currency")]
        public Currency Currency { get; set; } = Currency.ETB;
        [Display(Name = "Is Active")]
        public bool IsActive => PeerageConstant.CurrentTimeStamp >= StartDate && PeerageConstant.CurrentTimeStamp <= EndDate;
        [StringLength(500, ErrorMessage = "Notes cannot exceed 500 characters")]
        [Display(Name = "Notes")]
        public string? Notes { get; set; }

        [Required]
        [Display(Name = "Created Date")]
        public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
        [Required]
        [StringLength(50, ErrorMessage = "Created by cannot exceed 50 characters")]
        [Display(Name = "Created By")]
        public string CreatedBy { get; set; } = "System";
        [Display(Name = "Modified Date")]
        public DateTime? ModifiedDate { get; set; }
        [StringLength(50, ErrorMessage = "Modified by cannot exceed 50 characters")]
        [Display(Name = "Modified By")]
        public string? ModifiedBy { get; set; }

        [NotMapped]
        [Display(Name = "Variance")]
        [DataType(DataType.Currency)]
        public decimal Variance => BudgetAmount - ForCastAmount;
        [NotMapped]
        [Display(Name = "Variance Percentage")]
        [DisplayFormat(DataFormatString = "{0:P2}")]
        public decimal VariancePercentage => ForCastAmount == 0 ? 0 : (BudgetAmount - ForCastAmount) / ForCastAmount;

        [ForeignKey(nameof(CompanyId))]
        public OrganizationChart? Company { get; set; }
    }
}