using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum TrainingTypes
    {
        [Display(Name = "ShortTerm", ResourceType = typeof(TrainingResource))]
        ShortTerm,
        [Display(Name = "MidTerm", ResourceType = typeof(TrainingResource))]
        MidTerm,
        [Display(Name = "LongTerm", ResourceType = typeof(TrainingResource))]
        LongTerm,
        [Display(Name = "Other", ResourceType = typeof(TrainingResource))]
        Other
    }
}
