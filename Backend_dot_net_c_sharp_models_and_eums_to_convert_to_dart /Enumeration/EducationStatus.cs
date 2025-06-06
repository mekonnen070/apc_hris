using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum EducationStatus
    {
        [Display(Name = "In Progress")]
        InProgress,

        [Display(Name = "Completed")]
        Completed, 
        [Display(Name = "On Hold")]
        OnHold,

        [Display(Name = "Fraud")]
        Fraud
    }
}
