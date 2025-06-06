using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum PlacementTitles
    {
        [Display(Name = "Commander")]
        [Description("Commander")]
        Commander,

        [Display(Name = "Deputy Commander")]
        [Description("Deputy Commander")]
        DeputyCommander,

        [Display(Name = "Chief Inspector")]
        [Description("Chief Inspector")]
        ChiefInspector,

        [Display(Name = "Inspector")]
        [Description("Inspector")]
        Inspector,

        [Display(Name = "Deputy Inspector")]
        [Description("Deputy Inspector")]
        DeputyInspector,

        [Display(Name = "Assistant Inspector")]
        [Description("Assistant Inspector")]
        AssistantInspector,

        [Display(Name = "Chief Sergeant")]
        [Description("Chief Sergeant")]
        ChiefSergeant,

        [Display(Name = "Sergeant")]
        [Description("Sergeant")]
        Sergeant,

        [Display(Name = "Deputy Sergeant")]
        [Description("Deputy Sergeant")]
        DeputySergeant,

        [Display(Name = "Assistant Sergeant")]
        [Description("Assistant Sergeant")]
        AssistantSergeant,

        [Display(Name = "Constable")]
        [Description("Constable")]
        Constable,
    }
}
