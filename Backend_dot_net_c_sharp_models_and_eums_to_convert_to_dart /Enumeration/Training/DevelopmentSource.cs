using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum DevelopmentSource
    {
        [Display(Name = "DevelopmentSource_External", ResourceType = typeof(TrainingResource))]
        External,

        [Display(Name = "DevelopmentSource_Internal", ResourceType = typeof(TrainingResource))]
        Internal
    }
}
