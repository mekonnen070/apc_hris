// Ignore Spelling: Ims Iib Sms Auth

using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Twilio.Types;

namespace PeerageHRIS.Models.Integration
{
    public class Emails
    {
        [Key]
        public int Id { get; set; }
        public string Server { get; set; } = string.Empty;
        public SmtpConnection ConnectionType { get; set; } = SmtpConnection.TLS;
        public int Port { get; set; }
        public string SenderName { get; set; } = string.Empty;
        public string SenderEmail { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public DateTime EntryDate { get; set; }
    }
    public enum SmtpConnection
    {
        TLS,
        SSL
    }
}
