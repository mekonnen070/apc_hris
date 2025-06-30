// lib/core/constants/api_endpoints.dart

class ApiEndpoints {
  // =======================================================================
  // UserAccount Module
  // =======================================================================
  static const String _userAccount = '/UserAccount';
  static const String signUp = '$_userAccount/SignUp'; // POST
  static const String login = '$_userAccount/Login'; // POST
  static const String logOff = '$_userAccount/LogOff'; // POST
  static const String setLanguage = '$_userAccount/SetLanguage'; // GET
  static const String forgotPassword =
      '$_userAccount/ForgotPassword'; // GET & POST
  static const String resetPassword = '$_userAccount/ResetPassword'; // POST
  // Note: Many UserAccount endpoints are for UI navigation (e.g., ConfirmEmail)
  // or have identical paths for GET and POST. We define the path once.
  // The DioClient method (get, post) determines the action.

  // =======================================================================
  // Location Module
  // =======================================================================
  static const String _location = '/Location';
  static const String regions = '$_location/regions'; // GET
  static String zones({required String region}) =>
      '$_location/zones/$region'; // GET
  static String woredas({required String zone}) =>
      '$_location/woredas/$zone'; // GET
  static String kebeles({required String woreda}) =>
      '$_location/kebeles/$woreda'; // GET

  // =======================================================================
  // Transfer Module
  // =======================================================================
  static const String _transfer = '/Transfer';
  static const String transferRequests = '$_transfer/requests'; // GET
  static const String transferDetails = '$_transfer/Details'; // GET
  static const String createTransfer = '$_transfer/Create'; // POST
  static const String editTransfer = '$_transfer/Edit'; // POST
  static String deleteTransfer({required String id}) =>
      '$_transfer/$id'; // DELETE
  static const String getLocationDataByEmployee =
      '$_transfer/GetLocationDataByEmployee'; // GET
  static const String getDepartmentByLocation =
      '$_transfer/GetDepartmentByLocation'; // GET
  static const String getPositionByDepartment =
      '$_transfer/GetPositionByDepartment'; // GET
  static const String submitTransferData = '$_transfer/SubmitData'; // POST
  static const String initiateTransferSelection =
      '$_transfer/InitiateSelection'; // GET

  // Base feature paths to avoid repetition
  static const String _newRecruit = '/NewRecruit';
  static const String _leave = '/leave';
  static const String _training = '/training';
  static const String _placement = '/placement';
  static const String _recruitment = '/RecruitAnnouncement';

  // --- Recruit/My Recruits Endpoints ---
  static const String recruits = '$_newRecruit/recruits';
  /// POST  /api/NewRecruit/Create
  static const String createRecruit = '$_newRecruit/Create';
  /// POST  /api/NewRecruit/Edit
  static const String editRecruit = '$_newRecruit/Edit';

  // --- Recruitment Announcements Endpoints ---
  static const String recruitmentAnnouncements = '$_recruitment/announcements';

  // --- Leave Endpoints ---
  static const String leaveBalance = '$_leave/balance';
  static const String leaveRequests = '$_leave/requests';
  static const String leaveTypes = '$_leave/types';
  static const String applyForLeave = '$_leave/apply';

  // --- Training Endpoints ---
  static const String availableTrainings = '$_training/available';
  static const String trainingDetails = '$_training/details'; // Append /:id
  static const String applyForTraining = '$_training/apply'; // Append /:id
  static const String myTrainingApplications = '$_training/my-applications';
  static const String trainingSelectedApplicants =
      '$_training/selected-applicants'; // Append /:id
  static const String submitTrainingAppeal = '$_training/appeal'; // Append /:id

  // --- Placement Endpoints ---
  static const String availablePlacements = '$_placement/available';
  static const String placementDetails = '$_placement/details'; // Append /:id
  static const String applyForPlacement = '$_placement/apply'; // Append /:id
  static const String myPlacementApplications = '$_placement/my-applications';
  static const String placementSelectedApplicants =
      '$_placement/selected-applicants'; // Append /:id
  static const String submitPlacementAppeal =
      '$_placement/appeal'; // Append /:id

  // =======================================================================
  // Profile Module
  // =======================================================================
  static const String _profile = '/Profile';
  static String getEmployeeProfile({required String employeeId}) =>
      '$_profile/$employeeId';

  // The Architect's Note: Specific, RESTful endpoints for each sub-entity are required.
  static String education({required String employeeId}) =>
      '$_profile/$employeeId/education';
  static String educationById({
    required String employeeId,
    required String educationId,
  }) => '$_profile/$employeeId/education/$educationId';

  static String experience({required String employeeId}) =>
      '$_profile/$employeeId/experience';
  static String experienceById({
    required String employeeId,
    required String experienceId,
  }) => '$_profile/$employeeId/experience/$experienceId';

  static String dependant({required String employeeId}) =>
      '$_profile/$employeeId/dependant';
  static String dependantById({
    required String employeeId,
    required String dependantId,
  }) => '$_profile/$employeeId/dependant/$dependantId';

  static String contact({required String employeeId}) =>
      '$_profile/$employeeId/contact';
  static String contactById({
    required String employeeId,
    required String contactId,
  }) => '$_profile/$employeeId/contact/$contactId';

  static String spouse({required String employeeId}) =>
      '$_profile/$employeeId/spouse';
  static String spouseById({
    required String employeeId,
    required String spouseId,
  }) => '$_profile/$employeeId/spouse/$spouseId';
}
