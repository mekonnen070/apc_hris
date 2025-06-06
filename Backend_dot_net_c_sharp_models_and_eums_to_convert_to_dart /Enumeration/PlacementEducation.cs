using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum PlacementEducation
    {
        [Display(Name = "5th Grade and Lower")]
        [Description("5th Grade and Lower")]
        FifthGrade,

        [Display(Name = "6th and 7th Grade")]
        [Description("6th and 7th Grade")]
        SixthAndSeventh,

        [Display(Name = "8th and 9th Grade")]
        [Description("8th and 9th Grade")]
        EighthAndNinth,

        [Display(Name = "10th Complete")]
        [Description("10th Complete")]
        TenthComplete,

        [Display(Name = "Certificate Level One")]
        [Description("Certificate Level One")]
        CertificateLevelOne,

        [Display(Name = "Certificate Level Two")]
        [Description("Certificate Level Two")]
        CertificateLevelTwo,

        [Display(Name = "Diploma(Level 3) (1 Year Police Leadership Certificate)")]
        [Description("Diploma(Level 3) (1 Year Police Leadership Certificate)")]
        Diploma,

        [Display(Name = "Higher Diploma or Police Diploma or (Level 4)")]
        [Description("Higher Diploma or Police Diploma or (Level 4)")]
        HigherDiploma,

        [Display(Name = "First Degree")]
        [Description("First Degree")]
        FirstDegree,

        [Display(Name = "Second Degree")]
        [Description("Second Degree")]
        SecondDegree,

        [Display(Name = "PHD (Third Degree)")]
        [Description("PHD (Third Degree)")]
        PHD,
    }
}
