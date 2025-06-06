using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Administration
{
    public class ModuleHeader
    {
        [Key]
        [Required]
        public string? Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string IconName { get; set; } = "fa-solid fa-bell";
        public string MenuType { get; set; } = "Header";
        public bool IsActive { get; set; } = false;
        public string URLPath { get; set; } = "#";
        public ICollection<ModuleTree>? Trees { get; set; }
    }
}
