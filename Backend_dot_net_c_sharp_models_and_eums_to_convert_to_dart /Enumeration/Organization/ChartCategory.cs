using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace PeerageHRIS.Enumeration.Commission
{
    public enum ChartCategory
    {
        [AllowedNext(Zone, Woreda,SubCity,Station,Kebele)]
        Commission, // ክልል (Region)

        [AllowedNext(Woreda, SubCity, Station, Kebele)]
        Zone,       // �ዞን (Zone)

        [AllowedNext(SubCity, Station, Kebele)]
        Woreda,    // ወረዳ (Woreda - district)

        [AllowedNext(Station, Kebele)]
        SubCity,    // ክፍለ ከተማ (Sub-city)

        [AllowedNext(Kebele)]
        Station,    // ጣቢያ (Station)

        [AllowedNext] // No further allowed
        Kebele     // ቀበሌ (Kebele - neighborhood) 
    }

    // Custom attribute to define allowed next selections
    [AttributeUsage(AttributeTargets.Field, AllowMultiple = false)]
    public class AllowedNextAttribute : Attribute
    {
        public ChartCategory[] AllowedNext { get; }

        public AllowedNextAttribute(params ChartCategory[] allowedNext)
        {
            AllowedNext = allowedNext;
        }
    }

    public static class ChartCategoryExtensions
    {
        public static bool IsNextSelectionValid(this ChartCategory current, ChartCategory next)
        {
            var allowedNext = current.GetNextAllowedCategories();
            return allowedNext.Contains(next);
        }

        public static ChartCategory[] GetNextAllowedCategories(this ChartCategory current)
        {
            var field = current.GetType().GetField(current.ToString());
            var attribute = field!.GetCustomAttribute<AllowedNextAttribute>();
            return attribute?.AllowedNext ?? Array.Empty<ChartCategory>();
        }
    }
}

/**
 //usages

 var current = ChartCategory.Commission;
var next = ChartCategory.Zone;

if (current.IsNextSelectionValid(next))
{
    Console.WriteLine("Valid transition!");
}
else
{
    Console.WriteLine("Invalid transition!");
}

// Get allowed next values:
var allowedNext = current.GetNextAllowedCategories();
Console.WriteLine($"Allowed next: {string.Join(", ", allowedNext)}");
*/