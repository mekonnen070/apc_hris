using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Reflection;

namespace PeerageHRIS.Enumeration
{
    public enum Currency
    {
        [Display(Name = "ETB", ShortName = "Br",
                Description = "Ethiopian Birr", ResourceType = typeof(TrainingResource))]
        ETB,

        [Display(Name = "USD", ShortName = "$",
                Description = "US Dollar", ResourceType = typeof(TrainingResource))]
        USD,

        [Display(Name = "EUR", ShortName = "€",
                Description = "Euro",  ResourceType = typeof(TrainingResource))]
        EUR,

        [Display(Name = "GBP", ShortName = "£",
                Description = "British Pound",  ResourceType = typeof(TrainingResource))]
        GBP
    }

    public static class CurrencyExtensions
    {
        public static string GetLocalizedName(this Currency currency)
        {
            var field = currency.GetType().GetField(currency.ToString());
            var displayAttr = field?.GetCustomAttribute<DisplayAttribute>();

            if (displayAttr?.ResourceType != null && !string.IsNullOrEmpty(displayAttr.Name))
            {
                var resourceManager = new System.Resources.ResourceManager(displayAttr.ResourceType);
                return resourceManager.GetString(displayAttr.Name) ?? displayAttr.Description;
            }
            return displayAttr?.Description ?? currency.ToString();
        }

        public static string FormatAmount(this Currency currency, decimal amount, bool includeSymbol = true)
        {
            return currency switch
            {
                Currency.ETB => includeSymbol ? $"{amount:N2} Br" : $"{amount:N2}",
                Currency.USD => includeSymbol ? $"{amount:N2}$" : $"{amount:N2}",
                Currency.EUR => includeSymbol ? $"{amount:N2}€" : $"{amount:N2}",
                Currency.GBP => includeSymbol ? $"{amount:N2}£" : $"{amount:N2}",
                _ => $"{amount:N2}"
            };
        }

        public static string GetCultureCode(this Currency currency) => currency switch
        {
            Currency.ETB => "et-ET",
            Currency.USD => "en-US",
            Currency.EUR => "fr-FR", // Most common Eurozone culture
            Currency.GBP => "en-GB",
            _ => CultureInfo.CurrentCulture.Name
        };
    }
}