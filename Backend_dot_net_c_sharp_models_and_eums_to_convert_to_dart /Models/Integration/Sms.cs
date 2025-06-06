// Ignore Spelling: Ims Iib Sms Auth

using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Twilio.Types;

namespace PeerageHRIS.Models.Integration
{
    public class Sms
    {
        [Key]
        public int Id { get; set; }
        public string AccountSID { get; set; } = string.Empty;
        public string AuthToken { get; set; } = string.Empty;
        [DataType(DataType.PhoneNumber)]
        public string? FromNumber { get; set; }
        public DateTime EntryDate { get; set; }

    }
}
