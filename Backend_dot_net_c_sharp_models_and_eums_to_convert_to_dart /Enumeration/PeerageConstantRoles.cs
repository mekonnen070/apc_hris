using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PeerageHRIS.Enumeration
{
    public enum PeerageConstantRoles
    {
        [Description("Software Developer")]
        Developer, 
        [Description("Administrator")]
        Administrator,
        [Description("HR Manager")]
        HRManager,
        [Description("Line Manager")]
        LineManager,
        [Description("HR Officer")]
        HROfficer,
        [Description("Commission Employee")]
        Employee,
        [Description("Payroll Administrator")]
        Payroll,
        [Description("Commission Auditor")]
        Auditor
    }
}
