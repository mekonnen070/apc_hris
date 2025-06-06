using Microsoft.AspNetCore.Identity;

namespace PeerageHRIS.Models.Administration
{
    public class PeerageRoleClaim : IdentityRoleClaim<string>
    {
        public string? HeaderId { get; set; }
        public string? ModuleId { get; set; }
        public bool CreateClaim { get; set; }
        public bool EditClaim { get; set; }
        public bool ViewClaim { get; set; }
        public bool DeleteClaim { get; set; }
        public string? ModuleName { get; set; }
        public string? MenuType { get; set; }
        public string? IconName { get; set; }
        public string? URLPath { get; set; }
        public bool IsParent { get; set; }
        public string? Parental { get; set; }
        public int? SortCode { get; set; }
        public virtual PeerageRole? Role { get; set; }
        public virtual ModuleTree? Module { get; set; }
    }
}
