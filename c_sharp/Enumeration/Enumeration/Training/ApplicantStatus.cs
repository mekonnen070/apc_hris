using PeerageHRIS.Resources.Models.Training;
using System.ComponentModel.DataAnnotations;

namespace PeerageHRIS.Enumeration.Training
{
    public enum ApplicantStatus
    {
        [Display(Name = "ApplicantStatus_Pending", ResourceType = typeof(TrainingResource))]
        Pending,
        [Display(Name = "ApplicantStatus_Submitted", ResourceType = typeof(TrainingResource))]
        Submitted,
        [Display(Name = "ApplicantStatus_Selected", ResourceType = typeof(TrainingResource))]
        Selected,
        [Display(Name = "ApplicantStatus_Rejected", ResourceType = typeof(TrainingResource))]
        Rejected,
        [Display(Name = "ApplicantStatus_UnderReview", ResourceType = typeof(TrainingResource))]
        UnderReview,
        [Display(Name = "ApplicantStatus_Offered", ResourceType = typeof(TrainingResource))]
        Offered,
        [Display(Name = "ApplicantStatus_Completed", ResourceType = typeof(TrainingResource))]
        Completed,
        [Display(Name = "ApplicantStatus_Progress", ResourceType = typeof(TrainingResource))]
        Progress,
        [Display(Name = "ApplicantStatus_Withdrawn", ResourceType = typeof(TrainingResource))]
        Withdrawn
    }

    public static class ApplicantStatusExtensions
    { 
        public static List<ApplicantStatus> GetNextValidStatuses(this ApplicantStatus currentStatus)
        {
            switch (currentStatus)
            {
                case ApplicantStatus.Pending:
                    return new List<ApplicantStatus> {
                        ApplicantStatus.Submitted,
                        ApplicantStatus.Rejected
                    };
                case ApplicantStatus.Submitted:
                    return new List<ApplicantStatus> {
                        ApplicantStatus.Selected,
                        ApplicantStatus.Rejected
                    };

                case ApplicantStatus.Selected:
                    return new List<ApplicantStatus> {
                        ApplicantStatus.UnderReview,
                        ApplicantStatus.Rejected
                    };
                case ApplicantStatus.UnderReview:
                    return new List<ApplicantStatus> {
                        ApplicantStatus.Offered,
                        ApplicantStatus.Rejected
                    };
                case ApplicantStatus.Offered:
                    return new List<ApplicantStatus> {
                        ApplicantStatus.Progress,
                        ApplicantStatus.Completed,
                        ApplicantStatus.Withdrawn
                    };
                case ApplicantStatus.Progress:
                    return new List<ApplicantStatus> { 
                        ApplicantStatus.Completed,
                        ApplicantStatus.Withdrawn
                    };

                default:
                    return new List<ApplicantStatus>();
            }
        }
    }
}