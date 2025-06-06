using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    /// <summary>
    /// Enumeration of education levels with Ethiopian and international equivalents
    /// </summary>
    public enum EducationLevel
    {
        // Primary and Secondary Education
        [Display(Name = "Elementary School (1-8)")]
        ElementarySchool,

        [Display(Name = "Secondary School (9-10)")]
        SecondarySchoolFirstCycle,

        [Display(Name = "Preparatory School (11-12)")]
        SecondarySchoolSecondCycle,

        [Display(Name = "TVET (10+1/10+2/10+3)")]
        TVET,

        // Higher Education
        [Display(Name = "Certificate (10+1/10+2)")]
        Certificate,

        [Display(Name = "Diploma (10+3)")]
        Diploma,

        [Display(Name = "Advanced Diploma (10+4)")]
        AdvancedDiploma,

        [Display(Name = "Bachelor's Degree")]
        BachelorsDegree,

        [Display(Name = "Bachelor's Degree (5-year program)")]
        BachelorsDegreeFiveYear,

        [Display(Name = "LL.B Degree")]
        LLBDegree,

        [Display(Name = "MD Degree")]
        MDDegree,

        [Display(Name = "PharmD Degree")]
        PharmDDegree,

        // Postgraduate Studies
        [Display(Name = "Postgraduate Diploma")]
        PostgraduateDiploma,

        [Display(Name = "Master's Degree")]
        MastersDegree,

        [Display(Name = "MBA")]
        MBA,

        [Display(Name = "LLM")]
        LLM,

        [Display(Name = "Specialty Certificate")]
        SpecialtyCertificate,

        [Display(Name = "Doctor of Medicine (Specialty)")]
        DoctorOfMedicineSpecialty,

        [Display(Name = "PhD")]
        PhD,

        // International Equivalents
        [Display(Name = "Associate Degree")]
        AssociateDegree,

        [Display(Name = "High School Diploma")]
        HighSchoolDiploma,

        [Display(Name = "GED")]
        GED,

        [Display(Name = "Other")]
        Other
    }

    public static class EducationLevelExtensions
    {
        /// <summary>
        /// Gets the category of education level
        /// </summary>
        public static string GetEducationCategory(this EducationLevel level)
        {
            return level switch
            {
                EducationLevel.ElementarySchool or
                EducationLevel.SecondarySchoolFirstCycle or
                EducationLevel.SecondarySchoolSecondCycle or
                EducationLevel.HighSchoolDiploma or
                EducationLevel.GED
                    => "Secondary Education",

                EducationLevel.TVET or
                EducationLevel.Certificate or
                EducationLevel.Diploma or
                EducationLevel.AdvancedDiploma or
                EducationLevel.AssociateDegree
                    => "Technical/Vocational",

                EducationLevel.BachelorsDegree or
                EducationLevel.BachelorsDegreeFiveYear or
                EducationLevel.LLBDegree or
                EducationLevel.MDDegree or
                EducationLevel.PharmDDegree
                    => "Undergraduate",

                EducationLevel.PostgraduateDiploma or
                EducationLevel.MastersDegree or
                EducationLevel.MBA or
                EducationLevel.LLM or
                EducationLevel.SpecialtyCertificate or
                EducationLevel.DoctorOfMedicineSpecialty or
                EducationLevel.PhD
                    => "Postgraduate",

                _ => "Other"
            };
        }

        /// <summary>
        /// Gets the typical duration in years
        /// </summary>
        public static string GetTypicalDuration(this EducationLevel level)
        {
            return level switch
            {
                EducationLevel.ElementarySchool => "8 years",
                EducationLevel.SecondarySchoolFirstCycle => "2 years",
                EducationLevel.SecondarySchoolSecondCycle => "2 years",
                EducationLevel.TVET => "1-3 years",
                EducationLevel.Certificate => "1-2 years",
                EducationLevel.Diploma => "3 years",
                EducationLevel.AdvancedDiploma => "4 years",
                EducationLevel.BachelorsDegree => "4 years",
                EducationLevel.BachelorsDegreeFiveYear => "5 years",
                EducationLevel.LLBDegree => "4-5 years",
                EducationLevel.MDDegree => "6 years",
                EducationLevel.PharmDDegree => "5 years",
                EducationLevel.PostgraduateDiploma => "1 year",
                EducationLevel.MastersDegree => "2 years",
                EducationLevel.MBA => "2 years",
                EducationLevel.LLM => "2 years",
                EducationLevel.SpecialtyCertificate => "3-4 years",
                EducationLevel.DoctorOfMedicineSpecialty => "3-4 years",
                EducationLevel.PhD => "3-5 years",
                EducationLevel.AssociateDegree => "2 years",
                _ => "Varies"
            };
        }
    }
}