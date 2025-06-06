using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum RelativeReference
    {
        [Display(Name = "Direct", ResourceType = typeof(TrainingResource))]
        Direct,
        [Display(Name = "Indicated", ResourceType = typeof(TrainingResource))]
        Indicated,
    }
}