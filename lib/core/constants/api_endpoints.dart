// lib/core/constants/api_endpoints.dart

import 'dart:core';

class ApiEndpoints {
  // =======================================================================
  // UserAccount Module
  // =======================================================================
  static const String _userAccount = '/UserAccount';
  static const String signUp = '$_userAccount/SignUp';
  static const String login = '$_userAccount/Login';
  static const String logOff = '$_userAccount/LogOff';
  static const String setLanguage = '$_userAccount/SetLanguage';
  static const String forgotPassword = '$_userAccount/ForgotPassword';
  static const String resetPassword = '$_userAccount/ResetPassword';
  // Note: Many UserAccount endpoints are for UI navigation (e.g., ConfirmEmail)
  // or have identical paths for GET and POST. We define the path once.
  // The DioClient method (get, post) determines the action.

  // =======================================================================
  // Location Module
  // =======================================================================
  static const String _location = '/Location';
  static const String regions = '$_location/regions';
  static String zones({required String region}) => '$_location/zones/$region';
  static String woredas({required String zone}) => '$_location/woredas/$zone';
  static String kebeles({required String woreda}) =>
      '$_location/kebeles/$woreda';

  // =======================================================================
  // Transfer Module
  // =======================================================================
  static const String _transfer = '/transfer';
  static const String transferRequests = '$_transfer/requests';
  static const String transferDetails = '$_transfer/Details';
  static const String createTransfer = '$_transfer/Create';
  static const String editTransfer = '$_transfer/Edit';
  static const String deleteTransfer = '$_transfer/delete';
  static const String getDepartmentByLocation =
      '$_transfer/GetDepartmentByLocation';
  static const String getPositionByDepartment =
      '$_transfer/GetPositionByDepartment';
  static const String submitTransferData = '$_transfer/SubmitData';
  static const String initiateTransferSelection =
      '$_transfer/InitiateSelection';
  static const String locationData = '$_transfer/GetLocationDataByEmployee';

  // Base feature paths to avoid repetition
  static const String _newRecruit = '/newRecruit';
  static const String _leave = '/LvRequest';
  static const String _leaveBalance = '/LvBalance';
  static const String _leaveTypes = '/LvType';
  static const String _training = '/training';
  static const String _trainingApplication = '/trainingApplication';
  static const String _placementAnnouncement = '/placementAnnounce';
  static const String _placementApplication = '/placementApplication';
  static const String _recruitment = '/recruitAnnouncement';
  // https://192.168.8.130:7153/api/Clearance/Requests
  static const String _clearance = '/clearance';

  // --- Recruit/My Recruits Endpoints ---
  static const String recruits = '$_newRecruit/recruits';

  /// POST  /api/NewRecruit/Create
  static const String createRecruit = '$_newRecruit/create';

  /// POST  /api/NewRecruit/Edit
  static const String editRecruit = '$_newRecruit/edit';

  // --- Recruitment Announcements Endpoints ---
  static const String recruitmentAnnouncements = '$_recruitment/announcements';

  // --- Leave Endpoints ---
  static const String leaveRequests = '$_leave/requests';
  static const String applyForLeave = '$_leave/create';
  static const String editLeave = '$_leave/edit';
  static const String deleteLeave = '$_leave/delete';
  static const String leaveBalanceByEmployee =
      '$_leaveBalance/balanceByEmployee';
  static const String leaveTypes = '$_leaveTypes/leaveTypes';
  static const String leaveRequestByEmployee = '$_leave/requestByEmployee';

  // --- Training Endpoints ---
  static const String availableTrainings = '$_training/trainings';
  static const String trainingDetail = '$_training/detail';
  static const String applyForTraining = '$_trainingApplication/apply';
  static const String myTrainingApplications =
      '$_trainingApplication/applicationByEmployee';
  static const String trainingSelectedApplicants =
      '$_trainingApplication/selected-applicants';
  static const String submitTrainingAppeal = '$_trainingApplication/appeal';
  static const String trainingApprovedApplicants =
      '$_trainingApplication/approved-applicants';

  // --- Placement Endpoints ---
  static const String placementAnnouncements =
      '$_placementAnnouncement/placementAnnouncement';
  static const String createPlacementApplication =
      '$_placementApplication/create';
  static const String placementAnnouncementDetail =
      '$_placementAnnouncement/detail';
  static const String myPlacementApplications =
      '$_placementApplication/applicationByEmployee';
  static const String placementApprovedApplicants =
      '$_placementApplication/approvedApplicantsByAnnouncement';
  static const String placementApplicationDetail =
      '$_placementApplication/detail';
  static const String editPlacementApplication =
      '$_placementApplication/edit';
      static const String deletePlacementApplication =
      '$_placementApplication/delete';

  // --- Clearance Endpoints ---
  static const String createClearance = '$_clearance/request';
  static const String myClearanceRequests = '$_clearance/requestByEmployee';
  static const String deleteClearance = '$_clearance/delete';

  // =======================================================================
  // Profile Module
  // ==============================================§=========================
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

  // EmpProfile Module
  static const String _empProfile = '/empProfile';
  static const String employeeDetails = '$_empProfile/details';
  static const String employeeDataById = '$_empProfile/EmployeeDataById';
}
