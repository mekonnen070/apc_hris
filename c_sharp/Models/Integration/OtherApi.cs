// Ignore Spelling: Ims Iib Sms Auth

using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Twilio.Types;

namespace PeerageHRIS.Models.Integration
{
    public class OtherApi
    {
        [Key]
        public int Id { get; set; }
        public string PlaceName { get; set; } = string.Empty;
        [Precision(18, 6)]
        public decimal Latitude { get; set; }
        [Precision(18, 6)]
        public decimal Longitude { get; set; }
        public string Description { get; set; } = string.Empty;
        public DateTime EntryDate { get; set; }
    }
}
