// Ignore Spelling: Densa
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Models.Administration
{
    public class Message
    {
        [Display(Name = "Message Id")]
        public int Id { get; set; }
        [Display(Name = "User Id")]
        public string? UserId { get; set; }
        [Display(Name = "Display Name")]
        public string? DisplayName { get; set; }
        [Display(Name = "Font Awesome Icon")]
        public string? FontAwesomeIcon { get; set; }
        [Display(Name = "Avatar Url")]
        public string? AvatarURL { get; set; }
        [Display(Name = "Url Path")]
        public string? URLPath { get; set; }
        [Display(Name = "Short Description")]
        public string? ShortDesc { get; set; }
        [Display(Name = "Time Span")]
        public string? TimeSpan { get; set; }
        [Display(Name = "Percentage")]
        public int Percentage { get; set; }
        [Display(Name = "Message Type")]
        public string? Type { get; set; }
        public string? Priority { get; set; }
    }
}
