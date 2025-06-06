using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PeerageHRIS.Models.Administration
{
    public class PeerageRole : IdentityRole<string>
    {
        public PeerageRole() : base()
        {

        }
        public PeerageRole(string roleName) : this()
        {
            Name = roleName;
        }
        public virtual ICollection<PeerageUserRole>? Users { get; set; }
        public virtual ICollection<PeerageRoleClaim>? Claims { get; set; }
    }
}
