// Ignore Spelling: ip Densa Timestamp
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Administration
{
    public class UserAuditEvent
    {
        [Key]
        [Required]
        [Display(Name = "Event Id")]
        public int UserAuditId { get; set; }
        [Required]
        [Display(Name = "User Id")]
        public string? UserId { get; set; }
        [Display(Name = "Action Area")]
        [Column(TypeName = "nvarchar(Max)")]
        public string? ActionArea { get; set; }
        [Required]
        public UserAuditEventType AuditEvent { get; set; }
        public int DailyCount { get; set; } = 1;
        [Display(Name = "Data Change Events")]
        [Column(TypeName = "nvarchar(Max)")]
        public string? ChangeLogs { get; set; }
        [Required]
        public DateTimeOffset Timestamp { get; set; } = DateTime.UtcNow;
        [Column(TypeName = "nvarchar(Max)")]
        public string? HostAddress { get; set; }
        [ForeignKey("UserId")]
        public PeerageUser? users { get; set; }

        public static UserAuditEvent CreateAuditEvent(string userId, string ActionArea, UserAuditEventType auditEventType, string ipAddress, string changeLogs)
        {
            return new UserAuditEvent { UserId = userId, ActionArea = ActionArea, AuditEvent = auditEventType, HostAddress = ipAddress, ChangeLogs = changeLogs };
        }
    }

    public enum UserAuditEventType
    {
        Login = 1,
        FailedLogin = 2,
        LogOut = 3,
        Create = 4,
        Edit = 5,
        Delete = 6,
        View = 7,
    }
}
