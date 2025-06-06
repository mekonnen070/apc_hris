using PeerageHRIS.Resources;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Payroll
{
    public enum PayFrequency
    {
        [Display(Name = "One Time")]
        OneTime = 1,        
        [Display(Name ="Weekly")]
        Weekly = 2,         
        [Display(Name = "Monthly")]
        Monthly = 3,        
        [Display(Name = "Yearly")]
        Yearly = 4
    } 
}
