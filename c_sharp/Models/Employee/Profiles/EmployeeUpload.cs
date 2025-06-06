using Microsoft.Extensions.Localization;
using PeerageHRIS.Enumeration;
using PeerageHRIS.Extensions;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Profiles
{
    public class EmployeeUpload
    {
        [Key]
        //[Required]
        public string? DocumentId { get; set; }
        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [StringLength(36, ErrorMessageResourceName = "StringLengthError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "EmployeeId", ResourceType = typeof(EmployeeUploadResources))]
        public string? EmployeeId { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [StringLength(100, ErrorMessageResourceName = "StringLengthError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "DocumentName", ResourceType = typeof(EmployeeUploadResources))]
        public string? DocumentName { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "DocumentType", ResourceType = typeof(EmployeeUploadResources))]
        public DocumentType DocumentType { get; set; }

        [StringLength(255, ErrorMessageResourceName = "StringLengthError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "Description", ResourceType = typeof(EmployeeUploadResources))]
        public string? Description { get; set; }

        //[Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "FilePath", ResourceType = typeof(EmployeeUploadResources))]
        [StringLength(500, ErrorMessageResourceName = "StringLengthError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        public string? FilePath { get; set; }

        [NotMapped]
        [Display(Name = "DocumentFile", ResourceType = typeof(EmployeeUploadResources))]
        [DataType(DataType.Upload)]
        [AllowedExtensions(new[] { ".pdf", ".doc", ".docx", ".jpg", ".jpeg", ".png" })]
        [MaxFileSize(10 * 1024 * 1024, ErrorMessageResourceName = "MaxFileSizeError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        public IFormFile? DocumentFile { get; set; }

        [Display(Name = "ExpiryDate", ResourceType = typeof(EmployeeUploadResources))]
        [DataType(DataType.Date)]
        public DateTime? ExpiryDate { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        [Display(Name = "IsActive", ResourceType = typeof(EmployeeUploadResources))]
        public bool IsActive { get; set; } = true;
         
        [Display(Name = "UploadedBy", ResourceType = typeof(EmployeeUploadResources))]
        public string? UploadedBy { get; set; }

        [Display(Name = "UploadDate", ResourceType = typeof(EmployeeUploadResources))]
        public DateTime UploadDate { get; set; } = DateTime.UtcNow;

        [ForeignKey(nameof(EmployeeId))]
        [Display(Name = "Employee", ResourceType = typeof(EmployeeUploadResources))]
        public EmployeeInfo? Employee { get; set; }
    }
}
