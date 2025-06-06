using System.ComponentModel;

namespace PeerageHRIS.Enumeration
{
    public enum TransferReasons
    {
        [Description("Service")]
        Service,
        [Description("Marriage")]
        Marriage,
        [Description("Health Problem")]
        HealthProblem,
        [Description("Family / Work Matters")]
        FamilyOrWorkMater,
        [Description("Specail Placement")]
        SpecialPlacement
    }
}
