using PeerageHRIS.Enumeration;
using PeerageHRIS.Extensions;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Employee.Retirement
{
    public class RetirementArchive
    {
        [Key]
        public int ArchiveId { get; set; }
        [Required] 
        public int RetirementId { get; set; }
        [Required] 
        public DocumentType ArchiveType { get; set; }
        [Required]
        [StringLength(255)]
        public string? ArchiveFileName { get; set; }
        [NotMapped]
         [DataType(DataType.Upload)]
        [AllowedExtensions(new[] { ".pdf", ".doc", ".docx", ".jpg", ".jpeg", ".png" })]
        [MaxFileSize(10 * 1024 * 1024, ErrorMessageResourceName = "MaxFileSizeError", ErrorMessageResourceType = typeof(EmployeeUploadResources))]
        public IFormFile? ArchiveFile { get; set; } 
        public string? ArchivePath { get; set; }
        [DataType(DataType.Date)]
        public DateTime UploadDate { get; set; } = DateTime.UtcNow;
        [StringLength(450)]
        public string? UploadedBy { get; set; }
        [StringLength(500)]
        public string? Comments { get; set; }
        // Navigation property 
        [ForeignKey(nameof(RetirementId))]
        public virtual RetirementInfo? EmployeeRetirement { get; set; }
    }
}