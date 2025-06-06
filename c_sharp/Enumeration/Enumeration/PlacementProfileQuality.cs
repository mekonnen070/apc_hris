using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum PlacementProfileQuality
    {
        //[Display(Name = "Under High Discipline")]
        //UnderHighDiscipline,

        [Display(Name = "Two Easy Written Notice")]
        [Description("Two Easy Written Notice")]
        TwoEasyWrittenNotice,

        [Display(Name = "One Easy Written Notice")]
        OneEasyWrittenNotice,

        [Display(Name = "Oral Notice")]
        OralNotice,

        [Display(Name = "No Discipline")]
        NoDiscipline
    }
}
