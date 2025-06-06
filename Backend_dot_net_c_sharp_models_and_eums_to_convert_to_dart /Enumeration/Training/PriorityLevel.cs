using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum PriorityLevel
    {
        [Display(Name = "PriorityLevel_Low", ResourceType = typeof(TrainingResource))]
        Low,

        [Display(Name = "PriorityLevel_Medium", ResourceType = typeof(TrainingResource))]
        Medium,

        [Display(Name = "PriorityLevel_High", ResourceType = typeof(TrainingResource))]
        High,

        [Display(Name = "PriorityLevel_Critical", ResourceType = typeof(TrainingResource))]
        Critical
    }
}
