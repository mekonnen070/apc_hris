using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace PeerageHRIS.Enumeration.Training
{
    public enum TrainingModality
    {
        [Display(Name = "RegularEducation", ResourceType = typeof(TrainingResource))]
        RegularEducation,
        [Display(Name = "SummerEducation", ResourceType = typeof(TrainingResource))]
        SummerEducation,
        [Display(Name = "DistanceEducation", ResourceType = typeof(TrainingResource))]
        DistanceEducation,
        [Display(Name = "MissionaryEducation", ResourceType = typeof(TrainingResource))]
        MissionaryEducation,
        [Display(Name = "Other", ResourceType = typeof(TrainingResource))]
        Other
    }
    public static class TrainingWarrantyExtensions
    {
        public static string GetWarrantyPeriod(this TrainingWarranty warranty)
        {
            return warranty switch
            {
                TrainingWarranty.Certificate => "1 Year",
                TrainingWarranty.Diploma => "2 Years",
                TrainingWarranty.SeniorDiploma => "2.5 Years",
                TrainingWarranty.BscDegree => "3 Years",
                TrainingWarranty.MscDegree => "2 Years",
                TrainingWarranty.PhdDegree => "4 Years",
                TrainingWarranty.Other => "Not Set",
                _ => throw new ArgumentOutOfRangeException()
            };
        }

        public static string ToLocalizedString(this TrainingWarranty warranty)
        {
            var field = warranty.GetType().GetField(warranty.ToString());
            var displayAttr = field.GetCustomAttribute<DisplayAttribute>();
            return displayAttr?.GetName() ?? warranty.ToString();
        }
    }

    /*
        <label asp-for="WarrantyType"></label>
        <select asp-for="WarrantyType" 
                asp-items="Html.GetEnumSelectList<TrainingWarrenty>()" 
                class="form-control">
            <option value="">-- Select Warranty --</option>
        </select>


        @Model.WarrantyType.ToLocalizedString() 
        <span class="text-muted">(@Model.WarrantyType.GetWarrantyPeriod())</span>
    */
}
