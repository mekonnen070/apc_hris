using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PeerageHRIS.Models.Administration
{
    public class PeerageUserRole : IdentityUserRole<string>
    {
        public virtual PeerageUser? User { get; set; }
        public virtual PeerageRole? Role { get; set; }
    }
}
