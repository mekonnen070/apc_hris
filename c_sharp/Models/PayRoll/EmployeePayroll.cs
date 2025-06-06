using Microsoft.EntityFrameworkCore;
using PeerageHRIS.Enumeration.Payroll;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.PayRoll
{
    public class EmployeePayroll
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PayrollId { get; set; }

        [Required(ErrorMessage = "Employee ID is required")]
        [StringLength(20, ErrorMessage = "Employee ID cannot exceed 20 characters")]
        [Display(Name = "Employee ID")]
        public string? EmployeeId { get; set; }

        [Required(ErrorMessage = "Employee name is required")]
        [StringLength(100, ErrorMessage = "Employee name cannot exceed 100 characters")]
        [Display(Name = "Employee Name")]
        public string? EmployeeName { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        [StringLength(100, ErrorMessage = "Email cannot exceed 100 characters")]
        [Display(Name = "Employee Email")]
        public string? EmployeeEmail { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [Phone(ErrorMessage = "Invalid phone number")]
        [StringLength(20, ErrorMessage = "Phone number cannot exceed 20 characters")]
        [Display(Name = "Employee Phone")]
        public string? EmployeePhone { get; set; }

        [Required(ErrorMessage = "Pay period is required")]
        [StringLength(50, ErrorMessage = "Pay period description cannot exceed 50 characters")]
        [Display(Name = "Pay Period")]
        public string? PayPeriod { get; set; }

        [Required(ErrorMessage = "Pay start date is required")]
        [DataType(DataType.Date)]
        [Display(Name = "Pay Start Date")]
        public DateTime PayStartDate { get; set; }

        [Required(ErrorMessage = "Pay end date is required")]
        [DataType(DataType.Date)]
        [Display(Name = "Pay End Date")]
        [DateGreaterThan("PayStartDate", ErrorMessage = "End date must be after start date")]
        public DateTime PayEndDate { get; set; }

        [Required(ErrorMessage = "Department is required")]
        [StringLength(50, ErrorMessage = "Department name cannot exceed 50 characters")]
        [Display(Name = "Department")]
        public string? Department { get; set; }

        [Required(ErrorMessage = "Position is required")]
        [StringLength(50, ErrorMessage = "Position cannot exceed 50 characters")]
        [Display(Name = "Position")]
        public string? Position { get; set; }

        [Required(ErrorMessage = "Employment type is required")]
        [Display(Name = "Employment Type")]
        public EmploymentType EmploymentType { get; set; } = EmploymentType.FullTime;

        [StringLength(20, ErrorMessage = "Position rank cannot exceed 20 characters")]
        [Display(Name = "Position Rank")]
        public string? PositionRank { get; set; }

        [Required(ErrorMessage = "Work location is required")]
        [StringLength(50, ErrorMessage = "Work location cannot exceed 50 characters")]
        [Display(Name = "Work Location")]
        public string? WorkLocation { get; set; }

        [Range(0, 31, ErrorMessage = "Working days must be between 0 and 31")]
        [Display(Name = "Working")]
        public int WorkingDays { get; set; }

        [Range(0, 31, ErrorMessage = "Absent days must be between 0 and 31")]
        [Display(Name = "Absent")]
        public int AbsentDays { get; set; }

        [Range(0, 31, ErrorMessage = "Late days must be between 0 and 31")]
        [Display(Name = "Late Days")]
        public int LateDays { get; set; }

        [Range(0, 200, ErrorMessage = "Overtime hours must be between 0 and 200")]
        [Display(Name = "Overtime Hours")]
        public int OvertimeHours { get; set; }

        [Range(0, 31, ErrorMessage = "Leave days must be between 0 and 31")]
        [Display(Name = "Leave Days")]
        public int LeaveDays { get; set; }

        [Required(ErrorMessage = "Basic salary is required")]
        [Range(0, 999999.99, ErrorMessage = "Basic salary must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Basic Salary")]
        public decimal BasicSalary { get; set; }

        [Range(0, 999999.99, ErrorMessage = "House allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "House Allowance")]
        public decimal HouseAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Medical allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Medical Allowance")]
        public decimal MedicalAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Telephone allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Telephone Allowance")]
        public decimal TelephoneAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Position allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Position Allowance")]
        public decimal PositionAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Desert allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Desert Allowance")]
        public decimal DesertAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Hardship allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "HardShip Allowance")]
        public decimal HardShipAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Taxable allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Taxable Allowance")]
        public decimal TaxableAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Retention allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Retention Allowance")]
        public decimal RetentionAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Transport allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Transport Allowance")]
        public decimal TransportAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Field allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Field Allowance")]
        public decimal FieldAllowance { get; set; }

        [Range(0, 999999.99, ErrorMessage = "Clothing allowance must be between 0 and 999,999.99")]
        [DataType(DataType.Currency)]
        [Display(Name = "Clothing Allowance")]
        public decimal ClothingAllowance { get; set; }

        [Display(Name = "Total Taxable")]
        [Precision(18, 2)]
        [DataType(DataType.Currency)]
        public decimal TotalTaxable => BasicSalary + HouseAllowance + TransportAllowance + PositionAllowance + FieldAllowance;

        [Display(Name = "Total Non-taxable")]
        [Precision(18, 2)]
        [DataType(DataType.Currency)]
        public decimal TotalNonTaxable => MedicalAllowance + TelephoneAllowance + DesertAllowance + HardShipAllowance + RetentionAllowance;
    }

    // Custom validation attribute for date comparison
    public class DateGreaterThanAttribute : ValidationAttribute
    {
        private readonly string _comparisonProperty;

        public DateGreaterThanAttribute(string comparisonProperty)
        {
            _comparisonProperty = comparisonProperty;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var currentValue = (DateTime)value;
            var property = validationContext.ObjectType.GetProperty(_comparisonProperty);

            if (property == null)
                throw new ArgumentException("Property with this name not found");

            var comparisonValue = (DateTime)property.GetValue(validationContext.ObjectInstance);

            if (currentValue <= comparisonValue)
                return new ValidationResult(ErrorMessage);

            return ValidationResult.Success;
        }
    }
}