using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Administration
{
    public class SidebarMenu
    {
        [Required]
        public string? MenuType { get; set; }
        public bool IsActive { get; set; } = false;
        public string? ModId { get; set; }
        public string? Name { get; set; }
        public string? IconClassName { get; set; }
        public string? URLPath { get; set; }
        public string? Roles { get; set; }
        public List<SidebarMenu>? TreeChild { get; set; }
        public Tuple<int, int, int>? LinkCounter { get; set; }

        public bool IsEnabled { get; set; }
        public bool IsParent { get; set; }
        public string? Parental { get; set; }
        public int? SortCode { get; set; }
    }
}
