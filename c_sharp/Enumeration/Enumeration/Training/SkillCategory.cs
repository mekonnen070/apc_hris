using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum SkillCategory
    {
        [Display(Name = "SkillCategory_Technical", ResourceType = typeof(TrainingResource))]
        Technical,
        [Display(Name = "SkillCategory_Behavioral", ResourceType = typeof(TrainingResource))]
        Behavioral,
        [Display(Name = "SkillCategory_Leadership", ResourceType = typeof(TrainingResource))]
        Leadership,
        [Display(Name = "SkillCategory_Compliance", ResourceType = typeof(TrainingResource))]
        Compliance,
        [Display(Name = "SkillCategory_Software", ResourceType = typeof(TrainingResource))]
        Software,
        [Display(Name = "SkillCategory_Language", ResourceType = typeof(TrainingResource))]
        Language
    }
}
