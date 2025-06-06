using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeerageHRIS.Models.Administration
{
    public class ModuleTree
    {
        [Required]
        [Key]
        public string? Id { get; set; }
        [Required]
        public string? HeaderId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string MenuType { get; set; } = string.Empty;
        public string IconName { get; set; } = "fa-solid fa-bell";
        public string URLPath { get; set; } = "#";
        public bool IsParent { get; set; } = false;
        public string Parental { get; set; } = string.Empty;
        public int SortCode { get; set; } = 0;

        [ForeignKey(nameof(HeaderId))]
        public ModuleHeader? HId { get; set; }
    }
}
