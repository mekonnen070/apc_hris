import 'package:police_com/core/constants/api_constants.dart';

class ApiEndpoints {
  static const String baseUrl = ApiConstants.baseUrl;
  //  paths
  static const String signup = '/api/signup';
  static const String login = '/api/signin';
  static const String logout = '/api/logout';
  static const String forgotPassword = '/api/forgot-password';
  static const String recruitmentAnnouncements =
      '/api/recruitment-announcements';
  static const String recruits = '/api/recruits';
  static const String myRecruits = 'recruits/my';
  static const String updateRecruitsStatus = 'recruits/update-status'; // New
  static const String leaveBalance = 'leave/balance'; // New
  static const String leaveRequests = 'leave/requests'; // New
  static const String leaveTypes = 'leave/types'; // New
  // Training Endpoints
  static const String availableTrainings = 'training/available'; // New
  static const String trainingDetails = 'training/details'; // New
  static const String applyForTraining = 'training/apply'; // New
  static const String myTrainingApplications =
      'training/my-applications'; // New
  static const String trainingSelectedApplicants =
      'training/selected-applicants'; // New
  static const String submitTrainingAppeal = 'training/appeal'; // New
}
