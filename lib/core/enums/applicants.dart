/// Enum representing the status of a recruitment applicant.
/// Mirrors the C# Applicants enum in RecruitmentApplicant.cs.
///
/// Registered: Applicant has registered.
/// Selected: Applicant has been selected for further process.
/// Approved: Applicant has been approved/hired.
/// Failled: Applicant did not pass selection.
/// Rejected: Applicant was explicitly rejected.
enum Applicants {
  registered,
  selected,
  approved,
  failled, // Note: spelling matches backend for consistency
  rejected,
}
