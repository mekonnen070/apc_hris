using PeerageHRIS.Resources;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration
{
    public enum DocumentType
    {
        [Display(Name = "CV", ResourceType = typeof(Resources.CommonResources))]
        CV,
        [Display(Name = "Contract", ResourceType = typeof(Resources.CommonResources))]
        Contract,
        [Display(Name = "ID", ResourceType = typeof(Resources.CommonResources))]
        ID,
        [Display(Name = "Passport", ResourceType = typeof(Resources.CommonResources))]
        Passport,
        [Display(Name = "DrivingLicense", ResourceType = typeof(Resources.CommonResources))]
        DrivingLicense,
        [Display(Name = "AcademicCertificate", ResourceType = typeof(Resources.CommonResources))]
        AcademicCertificate,
        [Display(Name = "TrainingCertificate", ResourceType = typeof(Resources.CommonResources))]
        TrainingCertificate,
        [Display(Name = "PaySlip", ResourceType = typeof(Resources.CommonResources))]
        PaySlip,
        [Display(Name = "TaxDocument", ResourceType = typeof(Resources.CommonResources))]
        TaxDocument,
        [Display(Name = "MedicalReport", ResourceType = typeof(Resources.CommonResources))]
        MedicalReport,
        [Display(Name = "Other", ResourceType = typeof(Resources.CommonResources))]
        Other
    }
}
