using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum TrainingProfileReference
    {
        [Display(Name = "UnderHighDiscipline", ResourceType = typeof(TrainingResource))]
        UnderHighDiscipline,
        [Display(Name = "TwoEasyWrittenNotice", ResourceType = typeof(TrainingResource))]
        TwoEasyWrittenNotice,
        [Display(Name = "OneEasyWrittenNotice", ResourceType = typeof(TrainingResource))]
        OneEasyWrittenNotice,
        [Display(Name = "OralNotice", ResourceType = typeof(TrainingResource))]
        OralNotice,
        [Display(Name = "NoDiscipline", ResourceType = typeof(TrainingResource))]
        NoDiscipline
    }
}
