using PeerageHRIS.Resources;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum Gender
    {
        [Display(Name = "Male", ResourceType = typeof(CommonResources))]
        Male,
        [Display(Name = "Female", ResourceType = typeof(CommonResources))]
        Female,
        [Display(Name = "Other", ResourceType = typeof(CommonResources))]
        Other
    }
}
