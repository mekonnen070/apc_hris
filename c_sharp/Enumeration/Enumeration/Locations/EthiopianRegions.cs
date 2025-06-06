using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Locations
{
    public enum EthiopianRegion
    {
        [Display(Name = "AddisAbaba", ResourceType = typeof(CommonResources))]
        AddisAbaba,

        [Display(Name = "Afar", ResourceType = typeof(CommonResources))]
        Afar,

        [Display(Name = "Amhara", ResourceType = typeof(CommonResources))]
        Amhara,

        [Display(Name = "BenishangulGumuz", ResourceType = typeof(CommonResources))]
        BenishangulGumuz,

        [Display(Name = "DireDawa", ResourceType = typeof(CommonResources))]
        DireDawa,

        [Display(Name = "Gambela", ResourceType = typeof(CommonResources))]
        Gambela,

        [Display(Name = "Harari", ResourceType = typeof(CommonResources))]
        Harari,

        [Display(Name = "Oromia", ResourceType = typeof(CommonResources))]
        Oromia,

        [Display(Name = "Sidama", ResourceType = typeof(CommonResources))]
        Sidama,

        [Display(Name = "Somali", ResourceType = typeof(CommonResources))]
        Somali,

        [Display(Name = "SouthWestEthiopia", ResourceType = typeof(CommonResources))]
        SouthWestEthiopia,

        [Display(Name = "Southern", ResourceType = typeof(CommonResources))]
        Southern,

        [Display(Name = "Tigray", ResourceType = typeof(CommonResources))]
        Tigray
    }
}