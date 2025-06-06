// Ignore Spelling: Ims Iib Sms Auth

using Microsoft.Build.Evaluation;
using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Twilio.Types;

namespace PeerageHRIS.Models.Integration
{
    public class GoogleMaps
    {
        [Key]
        public int Id { get; set; }
        [Display(Name = "Place Name")]
        public string placeName { get; set; } = string.Empty;
        [Precision(18, 6)]
        public double Latitude { get; set; }
        [Precision(18, 6)]
        public double Longitude { get; set; }
        public string description { get; set; } = string.Empty;
        public DateTime EntryDate { get; set; }
    }
}
