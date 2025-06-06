using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Integration
{
    public class EmailOptions
    {
        public const string SectionName = "Email";

        [Required]
        public string SmtpServer { get; set; } = string.Empty;

        [Required]
        public int SmtpPort { get; set; }

        [Required]
        public string SmtpUsername { get; set; } = string.Empty;

        [Required]
        public string SmtpPassword { get; set; } = string.Empty;

        [Required]
        public string FromAddress { get; set; } = string.Empty;

        [Required]
        public string FromName { get; set; } = string.Empty;
    }
}
