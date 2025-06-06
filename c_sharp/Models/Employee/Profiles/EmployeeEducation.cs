using PeerageHRIS.Enumeration;
using PeerageHRIS.Models.Organization;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace PeerageHRIS.Models.Employee.Profiles
{ 
    public class EmployeeEducation
    {
        [Key] 
        [Display(Name = "Education ID")]
        [Column(TypeName = "nvarchar(50)")]
        public string? EducationId { get; set; }

        [Required(ErrorMessage = "Employee ID is required")]
        [Display(Name = "Employee ID")]
        [Column(TypeName = "nvarchar(50)")]
        public string? EmployeeId { get; set; }

        [Required(ErrorMessage = "Education level is required")]
        [Display(Name = "Education Level")]
        [Column(TypeName = "nvarchar(50)")]
        [StringLength(50, ErrorMessage = "Education level cannot exceed 50 characters")]
        public string? Education { get; set; }
        //public EducationLevel Education { get; set; }

        [Required(ErrorMessage = "University name is required")]
        [Display(Name = "University/Institution")]
        //[Column(TypeName = "nvarchar(200)")]
        //[StringLength(200, ErrorMessage = "University name cannot exceed 200 characters")]
        public EthiopianUniversity University { get; set; }

        [Display(Name = "GPA")]
        [Column(TypeName = "nvarchar(10)")]
        [RegularExpression(@"^[0-4]\.\d{1,2}$", ErrorMessage = "CGPA must be in format X.XX (0.00 to 4.00)")]
        public string? CGPA { get; set; }

        [Required(ErrorMessage = "Field of study is required")]
        [Display(Name = "Field Of Study")]
        //[Column(TypeName = "nvarchar(150)")]
        //[StringLength(150, ErrorMessage = "Field of study cannot exceed 150 characters")]
        public FieldOfStudy FieldOfStudy { get; set; }

        [Required(ErrorMessage = "Start date is required")]
        [Display(Name = "Start Date")]
        [DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd.MMM.yyyy}", NullDisplayText = "N/A")]
        public DateTime StartDate { get; set; } = DateTime.UtcNow;

        [Display(Name = "End Date")]
        [DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DateGreaterThan(nameof(StartDate), ErrorMessage = "End date must be after start date")]
        [DisplayFormat(DataFormatString = "{0:dd.MMM.yyyy}", NullDisplayText = "N/A")]
        public DateTime? EndDate { get; set; } =DateTime.UtcNow.Date.AddYears(3);

        [Required(ErrorMessage = "Education status is required")]
        [Display(Name = "Status")]
        //[Column(TypeName = "nvarchar(50)")]
        public EducationStatus EducationStatus { get; set; }

        [Required(ErrorMessage = "Entry by information is required")]
        [Display(Name = "Entered By")]
        [Column(TypeName = "nvarchar(100)")]
        public string? EntryBy { get; set; }

        [Required]
        [Display(Name = "Entry Date")]
        [DataType(DataType.DateTime)]
        public DateTime EntryDate { get; set; } = DateTime.Now;

        [Display(Name = "Is Approved")]
        public bool IsApproved { get; set; }

        // Navigation properties
        [ForeignKey(nameof(EmployeeId))]
        [JsonIgnore] // attributes prevent circular references
        public EmployeeInfo? Employee { get; set; }

        [ForeignKey(nameof(Education))]
        [JsonIgnore] // attributes prevent circular references
        public EducationCategories? EducationType { get; set; }
    }

    /// <summary>
    /// Custom validation attribute to ensure end date is after start date
    /// </summary>
    public class DateGreaterThanAttribute(string startDatePropertyName) : ValidationAttribute
    {
        private readonly string _startDatePropertyName = startDatePropertyName;

        protected override ValidationResult? IsValid(object? value, ValidationContext validationContext)
        {
            var endDate = value as DateTime?;
            if (!endDate.HasValue) return ValidationResult.Success;

            var propertyInfo = validationContext.ObjectType.GetProperty(_startDatePropertyName);
            if (propertyInfo == null)
                return new ValidationResult($"Unknown property: {_startDatePropertyName}");

            var startDate = (DateTime)propertyInfo.GetValue(validationContext.ObjectInstance)!;

            return endDate > startDate
                ? ValidationResult.Success
                : new ValidationResult(ErrorMessage ?? "End date must be after start date");
        }
    }
}