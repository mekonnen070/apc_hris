using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PeerageHRIS.Models.Administration
{
    public class PeerageUserLogin : IdentityUserLogin<string>
    {
        public virtual PeerageUser? User { get; set; }
    }
}
