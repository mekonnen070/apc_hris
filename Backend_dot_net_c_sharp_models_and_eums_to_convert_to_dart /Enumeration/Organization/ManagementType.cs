using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Commission
{
    public enum ManagementType
    {
        General,//ዋና ኃላፊ
        Dupty,// ምክትል ኃላፊ
        Directorate,// ዳይሬክቶሬት
        [Display(Name = "Process Owner")]
        ProcessOwner,// ስራ ሂዳት
        [Display(Name = "Team Coordinator")]
        TeamCordinator, //ቡድን አስተባባሪ
        [Display(Name = "Team Leader")]
        TeamLeader,// ቡድን መሪ
        Designation //የስራ መደብ
    }
}
