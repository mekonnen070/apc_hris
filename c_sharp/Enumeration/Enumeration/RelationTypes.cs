using PeerageHRIS.Resources.Models.Employee.Profiles;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum RelationTypes
    {
        [Display(Name = "Husband", ResourceType = typeof(EmployeeDependantResource))]
        Husband,
        [Display(Name = "Wife", ResourceType = typeof(EmployeeDependantResource))]
        Wife,
        [Display(Name = "Child", ResourceType = typeof(EmployeeDependantResource))]
        Child,
        [Display(Name = "Father", ResourceType = typeof(EmployeeDependantResource))]
        Father,
        [Display(Name = "Mother", ResourceType = typeof(EmployeeDependantResource))]
        Mother,
        [Display(Name = "Brother", ResourceType = typeof(EmployeeDependantResource))]
        Brother,
        [Display(Name = "Sister", ResourceType = typeof(EmployeeDependantResource))]
        Sister, 
        [Display(Name = "Guardian", ResourceType = typeof(EmployeeDependantResource))]
        Guardian,
        [Display(Name = "Other", ResourceType = typeof(EmployeeDependantResource))]
        Other
    }
}
