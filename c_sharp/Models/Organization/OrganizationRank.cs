using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Enumeration.Commission;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Organization
{
    [Table("OrganizationRanks")]  // Explicit table name
    [Index(nameof(LevelName), IsUnique = true)]  // Ensure LevelName is unique
    public class OrganizationRank
    {
        [Key] 
        [StringLength(36)]  // Assuming GUID
        [Display(Name = "ID")]
        public string? LevelId { get; set; }// = Guid.NewGuid().ToString();  // Auto-generate ID
        [Required] 
        [Display(Name = "Organization")]
        public string CommissionId { get; set; } = null!;  // Non-null-able with null-forgiving operator
        [Required]
        [StringLength(100)]
        [Display(Name = "Level Name")]
        public string LevelName { get; set; } = null!;
        [Display(Name = "Basic Salary")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue, ErrorMessage = "Basic salary must be positive")]
        public decimal BasicSalary { get; set; }
        // Group related allowances together
        #region Allowances
        [Display(Name = "House Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal House { get; set; } = 00.00m;
        [Display(Name = "Medical Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Medical { get; set; } = 00.00m;
        [Display(Name = "Telephone Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Telephone { get; set; } = 00.00m;
        [Display(Name = "Position Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Position { get; set; } = 00.00m;
        [Display(Name = "Desert Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal DesertAllowance { get; set; } = 00.00m;
        [Display(Name = "HardShip Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal HardShipAllowance { get; set; } = 00.00m;
        [Display(Name = "Taxable Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal TaxableAllowance { get; set; } = 00.00m;
        [Display(Name = "Retention Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal RetantionAllowance { get; set; } = 00.00m;

        [Display(Name = "Transport Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Transport { get; set; } = 00.00m;
        [Display(Name = "Field Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Field { get; set; } = 00.00m;
        [Display(Name = "Clothing Allowance")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal Clothing { get; set; } = 00.00m;
        #endregion
        [Display(Name = "Maximum Salary Limit")]
        [Precision(18, 2)]
        [Range(0, double.MaxValue)]
        public decimal MaxSalaryLimit { get; set; } = 00.00m;
        public StructureType StructureType { get; set; } = StructureType.Rank;
        [Display(Name = "Is Active")]
        public bool Enabled { get; set; } = true;
     
        // Audit fields 
        [StringLength(36)]
        [Display(Name = "Entry By")]
        public string EntryBy { get; set; } = null!;
        [Display(Name = "Entry Date")]
        [DataType(DataType.DateTime)]
        public DateTime EntryDate { get; set; } = DateTime.UtcNow;  // Default to current time
        [Display(Name = "Last Modified By")]
        [StringLength(36)]
        public string? ModifiedBy { get; set; }
        [Display(Name = "Last Modified Date")]
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedDate { get; set; }

        [Display(Name = "Total Compensation")]
        [Precision(18, 2)]
        public decimal TotalCompensation => BasicSalary + House + Medical + Transport + Field + Telephone + Position +
                                HardShipAllowance + Clothing + TaxableAllowance + DesertAllowance + RetantionAllowance;

        [Display(Name = "Is Within Salary Limit")]
        public bool IsWithinSalaryLimit => TotalCompensation <= MaxSalaryLimit;

        //validation for grade steps
        public int? MaxGradeSteps { get; set; }=10; // Default to 10, can be adjusted
        public int? MinGradeSteps { get; set; }=1; // Default to 1, can be adjusted
        public ICollection<int> ExistingGradeSteps { get; set; } = new List<int>(); 

        // Navigation properties
        [ForeignKey(nameof(CommissionId))]
        public  OrganizationChart? Organization { get; set; }
        public  ICollection<OrganizationPosition> Designations { get; set; } = new List<OrganizationPosition>();
        public  ICollection<OrganizationScale> LevelRanks { get; set; } = new List<OrganizationScale>();

        // Validation method
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (TotalCompensation > MaxSalaryLimit)
            {
                yield return new ValidationResult("Total compensation exceeds maximum salary limit",
                    new[] { nameof(BasicSalary), nameof(House), nameof(Transport) /* include all allowance fields */ });
            }
        }
    }
}