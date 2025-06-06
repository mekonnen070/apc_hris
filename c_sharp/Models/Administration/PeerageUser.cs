using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Administration
{
    public class PeerageUser : IdentityUser//<string>
    {
        [Display(Name = "First Name")]
        public string? FirstName { get; set; }
        [Display(Name = "Father Name")]
        public string? LastName { get; set; }
        [Display(Name = "User Photo")]
        public string? AvatarURL { get; set; }
        [Display(Name = "Entry date")]
        public DateTime DateRegistered { get; set; }
        public string? Position { get; set; }
        [Display(Name = "Nick Name")]
        public string? NickName { get; set; }
        public bool? IsActive { get; set; }=true;
        public bool? MustChangePassword { get; set; }=false;

        public virtual ICollection<PeerageUserToken>? UserTokens { get; set; }
        public virtual ICollection<PeerageUserRole>? Roles { get; set; }
        public virtual ICollection<PeerageUserLogin>? Logins { get; set; }
        public virtual ICollection<PeerageUserClaim>? Claims { get; set; }
        public virtual ICollection<UserAuditEvent>? AuditEvents { get; set; }
    }
}
