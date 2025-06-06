using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum QualificationType
    {
        [Display(Name = "Professional", ResourceType = typeof(TrainingResource))]
        Professional,
        [Display(Name = "Certification", ResourceType = typeof(TrainingResource))]
        Certification,
        [Display(Name = "Competency", ResourceType = typeof(TrainingResource))]
        Competency,
        [Display(Name = "Other", ResourceType = typeof(TrainingResource))]
        Other
    }
}
