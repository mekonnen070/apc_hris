import 'package:police_com/core/constants/api_constants.dart';

class ApiEndpoints {
  static const String baseUrl = ApiConstants.baseUrl;
  // Endpoint paths
  static const String signupEndpoint = '/api/signup';
  static const String loginEndpoint = '/api/signin';
  static const String logoutEndpoint = '/api/logout';
  static const String forgotPasswordEndpoint = '/api/forgot-password';
  static const String recruitmentAnnouncementsEndpoint =
      '/api/recruitment-announcements';
  static const String recruitsEndpoint = '/api/recruits';
  static const String myRecruits = 'recruits/my';
  static const String updateRecruitsStatus = 'recruits/update-status'; // New
}
