using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    /// <summary>
    /// Enumeration of Ethiopian universities and higher education institutions
    /// </summary>
    public enum EthiopianUniversity
    {
        // Public Universities
        [Display(Name = "Addis Ababa University")]
        AddisAbabaUniversity,

        [Display(Name = "Addis Ababa Science and Technology University")]
        AddisAbabaScienceAndTechnologyUniversity,

        [Display(Name = "Adama Science and Technology University")]
        AdamaScienceAndTechnologyUniversity,

        [Display(Name = "Bahir Dar University")]
        BahirDarUniversity,

        [Display(Name = "Mekelle University")]
        MekelleUniversity,

        [Display(Name = "Hawassa University")]
        HawassaUniversity,

        [Display(Name = "Arba Minch University")]
        ArbaMinchUniversity,

        [Display(Name = "Jimma University")]
        JimmaUniversity,

        [Display(Name = "Haramaya University")]
        HaramayaUniversity,

        [Display(Name = "Wollega University")]
        WollegaUniversity,

        [Display(Name = "Debre Markos University")]
        DebreMarkosUniversity,

        [Display(Name = "Dilla University")]
        DillaUniversity,

        [Display(Name = "Woldia University")]
        WoldiaUniversity,

        [Display(Name = "Madda Walabu University")]
        MaddaWalabuUniversity,

        [Display(Name = "Wolaita Sodo University")]
        WolaitaSodoUniversity,

        [Display(Name = "Debre Birhan University")]
        DebreBirhanUniversity,

        [Display(Name = "Gondar University")]
        GondarUniversity,

        [Display(Name = "Dire Dawa University")]
        DireDawaUniversity,

        [Display(Name = "Semera University")]
        SemeraUniversity,

        [Display(Name = "Assosa University")]
        AssosaUniversity,

        [Display(Name = "Bule Hora University")]
        BuleHoraUniversity,

        [Display(Name = "Mizan-Tepi University")]
        MizanTepiUniversity,

        [Display(Name = "Jigjiga University")]
        JigjigaUniversity,

        [Display(Name = "Ambo University")]
        AmboUniversity,

        [Display(Name = "Debre Tabor University")]
        DebreTaborUniversity,

        [Display(Name = "Wachemo University")]
        WachemoUniversity,

        [Display(Name = "Bonga University")]
        BongaUniversity,

        [Display(Name = "Metu University")]
        MetuUniversity,

        // Private Universities
        [Display(Name = "St. Mary's University")]
        StMarysUniversity,

        [Display(Name = "Unity University")]
        UnityUniversity,

        [Display(Name = "Admas University")]
        AdmasUniversity,

        [Display(Name = "Rift Valley University")]
        RiftValleyUniversity,

        [Display(Name = "Ethiopian Civil Service University")]
        EthiopianCivilServiceUniversity,

        [Display(Name = "Alpha University")]
        AlphaUniversity,

        [Display(Name = "New Generation University")]
        NewGenerationUniversity,

        [Display(Name = "Kea-Med University")]
        KeaMedUniversity,

        [Display(Name = "HiLCoE School of Computer Science and Technology")]
        HiLCoE,

        [Display(Name = "American College of Technology")]
        AmericanCollegeOfTechnology,

        [Display(Name = "Harmaya University (Private)")]
        HarmayaUniversityPrivate,

        [Display(Name = "Jiren University")]
        JirenUniversity,

        [Display(Name = "Bethel University")]
        BethelUniversity,

        [Display(Name = "Axum University")]
        AxumUniversity,

        [Display(Name = "Green Land College")]
        GreenLandCollege,

        // Specialized Institutions
        [Display(Name = "Ethiopian Institute of Architecture, Building Construction and City Development")]
        EiABC,

        [Display(Name = "Ethiopian Kotebe University of Education")]
        KotebeUniversityOfEducation,

        [Display(Name = "Defense University")]
        DefenseUniversity,

        [Display(Name = "Ethiopian Police University")]
        EthiopianPoliceUniversity,

        [Display(Name = "Ethiopian Aviation University")]
        EthiopianAviationUniversity,

        [Display(Name = "Ethiopian Management Institute")]
        EthiopianManagementInstitute,

        [Display(Name = "Ethiopian Film Academy")]
        EthiopianFilmAcademy,

        [Display(Name = "Other Institution")]
        Other
    }
}