using PeerageHRIS.Enumeration.Training;
using PeerageHRIS.Resources;
using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum TrainingWarranty
    {
        [Display(Name = "Certificate", ResourceType = typeof(TrainingResource))]
        Certificate,//1Year
        [Display(Name = "Diploma", ResourceType = typeof(TrainingResource))]
        Diploma,//2Years
        [Display(Name = "SeniorDiploma", ResourceType = typeof(TrainingResource))]
        SeniorDiploma,//2 years and 6 months
        [Display(Name = "BscDegree", ResourceType = typeof(TrainingResource))]
        BscDegree,//3Years
        [Display(Name = "MscDegree", ResourceType = typeof(TrainingResource))]
        MscDegree,//2 years
        [Display(Name = "PhdDegree", ResourceType = typeof(TrainingResource))]
        PhdDegree,// 4 years
        [Display(Name = "Other", ResourceType = typeof(TrainingResource))]
        Other,//not set
    }
}

public static class TrainingWarrantyExtensions
{
    public static TimeSpan GetDuration(this TrainingWarranty warranty) => warranty switch
    {
        TrainingWarranty.Certificate => TimeSpan.FromDays(365),
        TrainingWarranty.Diploma => TimeSpan.FromDays(365 * 2),
        TrainingWarranty.SeniorDiploma => TimeSpan.FromDays(365 * 2.5),
        TrainingWarranty.BscDegree => TimeSpan.FromDays(365 * 3),
        TrainingWarranty.MscDegree => TimeSpan.FromDays(365 * 2),
        TrainingWarranty.PhdDegree => TimeSpan.FromDays(365 * 4),
        _ => TimeSpan.Zero
    };
}
/*
 <select asp-for="WarrantyType" 
        asp-items="Html.GetEnumSelectList<TrainingWarranty>()"
        class="form-control">
</select>

<!-- Display with duration -->
<div>
    Duration: @Model.WarrantyType.GetDuration().TotalDays days
</div>
*/