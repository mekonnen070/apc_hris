using PeerageHRIS.Enumeration;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum GeneralStatus
    {
        [Display(Name = "Pending", ResourceType = typeof(TrainingResource))]
        Pending,
        [Display(Name = "Submitted", ResourceType = typeof(TrainingResource))]
        Submitted,
        [Display(Name = "Approved", ResourceType = typeof(TrainingResource))]
        Approved,
        [Display(Name = "Rejected", ResourceType = typeof(TrainingResource))]
        Rejected,
        [Display(Name = "Completed", ResourceType = typeof(TrainingResource))]
        Completed,
        [Display(Name = "Canceled", ResourceType = typeof(TrainingResource))]
        Canceled
    }
} 