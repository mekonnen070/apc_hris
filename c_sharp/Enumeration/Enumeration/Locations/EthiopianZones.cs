using PeerageHRIS.Resources;
using System.ComponentModel.DataAnnotations;
using Twilio.Rest.Api.V2010.Account;

namespace PeerageHRIS.Enumeration.Locations
{
    public static class EthiopianZones
    {
        public enum AddisAbaba
        {
            [Display(Name = "AddisAbaba_City", ResourceType = typeof(CommonResources))]
            AddisAbaba_City
        }

        public enum Afar
        {
            [Display(Name = "Zone1", ResourceType = typeof(CommonResources))]
            Zone1,
            [Display(Name = "Zone2", ResourceType = typeof(CommonResources))]
            Zone2,
            [Display(Name = "Zone3", ResourceType = typeof(CommonResources))]
            Zone3,
            [Display(Name = "Zone4", ResourceType = typeof(CommonResources))]
            Zone4,
            [Display(Name = "Zone5", ResourceType = typeof(CommonResources))]
            Zone5
        }

        public enum Amhara
        {
            [Display(Name = "NorthGonder", ResourceType = typeof(CommonResources))]
            NorthGonder,
            [Display(Name = "SouthGonder", ResourceType = typeof(CommonResources))]
            SouthGonder,
            [Display(Name = "NorthWollo", ResourceType = typeof(CommonResources))]
            NorthWollo,
            [Display(Name = "SouthWollo", ResourceType = typeof(CommonResources))]
            SouthWollo,
            [Display(Name = "NorthShoa", ResourceType = typeof(CommonResources))]
            NorthShoa,
            [Display(Name = "WestGojjam", ResourceType = typeof(CommonResources))]
            WestGojjam,
            [Display(Name = "EastGojjam", ResourceType = typeof(CommonResources))]
            EastGojjam,
            [Display(Name = "WagHemra", ResourceType = typeof(CommonResources))]
            WagHemra,
            [Display(Name = "Awi", ResourceType = typeof(CommonResources))]
            Awi,
            [Display(Name = "OromiaSpecial", ResourceType = typeof(CommonResources))]
            OromiaSpecial,
            [Display(Name = "BahirDarSpecial", ResourceType = typeof(CommonResources))]
            BahirDarSpecial
        }

        public enum BenishangulGumuz
        {
            [Display(Name = "Assosa", ResourceType = typeof(CommonResources))]
            Assosa,
            [Display(Name = "Kamashi", ResourceType = typeof(CommonResources))]
            Kamashi,
            [Display(Name = "Metekel", ResourceType = typeof(CommonResources))]
            Metekel,
            [Display(Name = "PaweSpecial", ResourceType = typeof(CommonResources))]
            PaweSpecial
        }

        public enum DireDawa
        {
            [Display(Name = "DireDawa_City", ResourceType = typeof(CommonResources))]
            DireDawa_City
        }

        public enum Gambela
        {
            [Display(Name = "Anyuak", ResourceType = typeof(CommonResources))]
            Anyuak,
            [Display(Name = "Majang", ResourceType = typeof(CommonResources))]
            Majang,
            [Display(Name = "Nuer", ResourceType = typeof(CommonResources))]
            Nuer
        }

        public enum Harari
        {
            [Display(Name = "Harari_City", ResourceType = typeof(CommonResources))]
            Harari_City
        }

        public enum Oromia
        {
            [Display(Name = "EastHararghe", ResourceType = typeof(CommonResources))]
            EastHararghe,
            [Display(Name = "WestHararghe", ResourceType = typeof(CommonResources))]
            WestHararghe,
            [Display(Name = "Arsi", ResourceType = typeof(CommonResources))]
            Arsi,
            [Display(Name = "Bale", ResourceType = typeof(CommonResources))]
            Bale,
            [Display(Name = "Borana", ResourceType = typeof(CommonResources))]
            Borana,
            [Display(Name = "EastShoa", ResourceType = typeof(CommonResources))]
            EastShoa,
            [Display(Name = "WestShoa", ResourceType = typeof(CommonResources))]
            WestShoa,
            [Display(Name = "Illubabor", ResourceType = typeof(CommonResources))]
            Illubabor,
            [Display(Name = "Jimma", ResourceType = typeof(CommonResources))]
            Jimma,
            [Display(Name = "WestArsi", ResourceType = typeof(CommonResources))]
            WestArsi,
            [Display(Name = "NorthShoa", ResourceType = typeof(CommonResources))]
            NorthShoa,
            [Display(Name = "SouthWestShoa", ResourceType = typeof(CommonResources))]
            SouthWestShoa,
            [Display(Name = "Guji", ResourceType = typeof(CommonResources))]
            Guji,
            [Display(Name = "HoroGudru", ResourceType = typeof(CommonResources))]
            HoroGudru,
            [Display(Name = "KelemWollega", ResourceType = typeof(CommonResources))]
            KelemWollega,
            [Display(Name = "WestWollega", ResourceType = typeof(CommonResources))]
            WestWollega,
            [Display(Name = "EastWollega", ResourceType = typeof(CommonResources))]
            EastWollega
        }

        public enum Sidama
        {
            [Display(Name = "Sidama_Central", ResourceType = typeof(CommonResources))]
            Sidama_Central,
            [Display(Name = "Sidama_East", ResourceType = typeof(CommonResources))]
            Sidama_East,
            [Display(Name = "Sidama_North", ResourceType = typeof(CommonResources))]
            Sidama_North,
            [Display(Name = "Sidama_South", ResourceType = typeof(CommonResources))]
            Sidama_South,
            [Display(Name = "Sidama_West", ResourceType = typeof(CommonResources))]
            Sidama_West
        }

        public enum Somali
        {
            [Display(Name = "Sitti", ResourceType = typeof(CommonResources))]
            Sitti,
            [Display(Name = "Fafan", ResourceType = typeof(CommonResources))]
            Fafan,
            [Display(Name = "Jarar", ResourceType = typeof(CommonResources))]
            Jarar,
            [Display(Name = "Nogob", ResourceType = typeof(CommonResources))]
            Nogob,
            [Display(Name = "Erer", ResourceType = typeof(CommonResources))]
            Erer,
            [Display(Name = "Dollo", ResourceType = typeof(CommonResources))]
            Dollo,
            [Display(Name = "Korahe", ResourceType = typeof(CommonResources))]
            Korahe,
            [Display(Name = "Shabelle", ResourceType = typeof(CommonResources))]
            Shabelle,
            [Display(Name = "Liben", ResourceType = typeof(CommonResources))]
            Liben,
            [Display(Name = "Afder", ResourceType = typeof(CommonResources))]
            Afder,
            [Display(Name = "Dawa", ResourceType = typeof(CommonResources))]
            Dawa
        }

        public enum SouthWestEthiopia
        {
            [Display(Name = "BenchSheko", ResourceType = typeof(CommonResources))]
            BenchSheko,
            [Display(Name = "Dawro", ResourceType = typeof(CommonResources))]
            Dawro,
            [Display(Name = "Keffa", ResourceType = typeof(CommonResources))]
            Keffa,
            [Display(Name = "Sheka", ResourceType = typeof(CommonResources))]
            Sheka,
            [Display(Name = "WestOmo", ResourceType = typeof(CommonResources))]
            WestOmo,
            [Display(Name = "KontaSpecial", ResourceType = typeof(CommonResources))]
            KontaSpecial
        }

        public enum Southern
        {
            [Display(Name = "GamoGofa", ResourceType = typeof(CommonResources))]
            GamoGofa,
            [Display(Name = "Gedeo", ResourceType = typeof(CommonResources))]
            Gedeo,
            [Display(Name = "Gurage", ResourceType = typeof(CommonResources))]
            Gurage,
            [Display(Name = "Hadiya", ResourceType = typeof(CommonResources))]
            Hadiya,
            [Display(Name = "KembataTembaro", ResourceType = typeof(CommonResources))]
            KembataTembaro,
            [Display(Name = "Siltie", ResourceType = typeof(CommonResources))]
            Siltie,
            [Display(Name = "Wolayita", ResourceType = typeof(CommonResources))]
            Wolayita,
            [Display(Name = "AlabaSpecial", ResourceType = typeof(CommonResources))]
            AlabaSpecial,
            [Display(Name = "YemSpecial", ResourceType = typeof(CommonResources))]
            YemSpecial
        }

        public enum Tigray
        {
            [Display(Name = "Central", ResourceType = typeof(CommonResources))]
            Central,
            [Display(Name = "East", ResourceType = typeof(CommonResources))]
            East,
            [Display(Name = "NorthWest", ResourceType = typeof(CommonResources))]
            NorthWest,
            [Display(Name = "South", ResourceType = typeof(CommonResources))]
            South,
            [Display(Name = "SouthEast", ResourceType = typeof(CommonResources))]
            SouthEast,
            [Display(Name = "West", ResourceType = typeof(CommonResources))]
            West,
            [Display(Name = "MekeleSpecial", ResourceType = typeof(CommonResources))]
            MekeleSpecial
        }
    }
}