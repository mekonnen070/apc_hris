enum RecruitmentStatus {
  submitted,
  rejected,
  shortListed,
  failed,
  waitListed,
  hired,
  // Added for more clarity in UI, can map to backend as needed
  applicationViewed,
  interviewScheduled,
  examScheduled,
  offerExtended,
  offerDeclined,
  onboarding, // From backend ApplicantApply
}