import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
  ];

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @enterEmailForReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset your password.'**
  String get enterEmailForReset;

  /// No description provided for @resetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get resetYourPassword;

  /// No description provided for @enterEmailForPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive password reset instructions.'**
  String get enterEmailForPasswordReset;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsRequired;

  /// No description provided for @enterAValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterAValidEmail;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @rememberedYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Remembered your password?'**
  String get rememberedYourPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @passwordResetSent.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Sent'**
  String get passwordResetSent;

  /// No description provided for @checkEmailForResetInstructions.
  ///
  /// In en, this message translates to:
  /// **'Check your email for reset instructions.'**
  String get checkEmailForResetInstructions;

  /// No description provided for @passwordResetFailed.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Failed'**
  String get passwordResetFailed;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @logInWithEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Log in with your email and password'**
  String get logInWithEmailAndPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsRequired;

  /// No description provided for @minimum6CharactersRequired.
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters required'**
  String get minimum6CharactersRequired;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @loginSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Login Successful'**
  String get loginSuccessful;

  /// No description provided for @youHaveSuccessfullyLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'You have successfully logged in.'**
  String get youHaveSuccessfullyLoggedIn;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get loginFailed;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAnAccount;

  /// No description provided for @signUpWithEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign up with your email and password'**
  String get signUpWithEmailAndPassword;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Full Name is required'**
  String get fullNameIsRequired;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressIsRequired;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneNumberIsRequired;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @birthDateIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Birth date is required'**
  String get birthDateIsRequired;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @maritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get maritalStatus;

  /// No description provided for @selectYourMaritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Select your marital status'**
  String get selectYourMaritalStatus;

  /// No description provided for @signupSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Signup Successful'**
  String get signupSuccessful;

  /// No description provided for @youHaveSuccessfullySignedUp.
  ///
  /// In en, this message translates to:
  /// **'You have successfully signed up.'**
  String get youHaveSuccessfullySignedUp;

  /// No description provided for @clearanceRequests.
  ///
  /// In en, this message translates to:
  /// **'Clearance Requests'**
  String get clearanceRequests;

  /// No description provided for @noClearanceRequests.
  ///
  /// In en, this message translates to:
  /// **'No clearance requests found.'**
  String get noClearanceRequests;

  /// No description provided for @requestClearance.
  ///
  /// In en, this message translates to:
  /// **'Request Clearance'**
  String get requestClearance;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get submitRequest;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @reasonIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Reason is required'**
  String get reasonIsRequired;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Description is required'**
  String get descriptionIsRequired;

  /// No description provided for @requestDate.
  ///
  /// In en, this message translates to:
  /// **'Request Date'**
  String get requestDate;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @myRecruits.
  ///
  /// In en, this message translates to:
  /// **'My Recruits'**
  String get myRecruits;

  /// No description provided for @noRecruitsFound.
  ///
  /// In en, this message translates to:
  /// **'No new recruits assigned to you.'**
  String get noRecruitsFound;

  /// No description provided for @newRecruit.
  ///
  /// In en, this message translates to:
  /// **'New Recruit'**
  String get newRecruit;

  /// No description provided for @recruitmentDetails.
  ///
  /// In en, this message translates to:
  /// **'Recruitment Details'**
  String get recruitmentDetails;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @emergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContact;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @documentManagement.
  ///
  /// In en, this message translates to:
  /// **'Document Management'**
  String get documentManagement;

  /// No description provided for @employmentDetails.
  ///
  /// In en, this message translates to:
  /// **'Employment Details'**
  String get employmentDetails;

  /// No description provided for @recruitment.
  ///
  /// In en, this message translates to:
  /// **'Recruitment'**
  String get recruitment;

  /// No description provided for @retirement.
  ///
  /// In en, this message translates to:
  /// **'Retirement'**
  String get retirement;

  /// No description provided for @incidentReports.
  ///
  /// In en, this message translates to:
  /// **'Incident Reports'**
  String get incidentReports;

  /// No description provided for @noIncidentReports.
  ///
  /// In en, this message translates to:
  /// **'No incident reports found.'**
  String get noIncidentReports;

  /// No description provided for @reportIncident.
  ///
  /// In en, this message translates to:
  /// **'Report Incident'**
  String get reportIncident;

  /// No description provided for @incidentType.
  ///
  /// In en, this message translates to:
  /// **'Incident Type'**
  String get incidentType;

  /// No description provided for @selectIncidentType.
  ///
  /// In en, this message translates to:
  /// **'Select Incident Type'**
  String get selectIncidentType;

  /// No description provided for @dateOfIncident.
  ///
  /// In en, this message translates to:
  /// **'Date of Incident'**
  String get dateOfIncident;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get pleaseEnterDescription;

  /// No description provided for @incidentDate.
  ///
  /// In en, this message translates to:
  /// **'Incident Date'**
  String get incidentDate;

  /// No description provided for @leaveManagement.
  ///
  /// In en, this message translates to:
  /// **'Leave Management'**
  String get leaveManagement;

  /// No description provided for @leaveHistory.
  ///
  /// In en, this message translates to:
  /// **'Leave History'**
  String get leaveHistory;

  /// No description provided for @requestLeave.
  ///
  /// In en, this message translates to:
  /// **'Request Leave'**
  String get requestLeave;

  /// No description provided for @noLeaveHistory.
  ///
  /// In en, this message translates to:
  /// **'No leave history found.'**
  String get noLeaveHistory;

  /// No description provided for @leaveBalance.
  ///
  /// In en, this message translates to:
  /// **'Leave Balance'**
  String get leaveBalance;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual;

  /// No description provided for @sick.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get sick;

  /// No description provided for @maternity.
  ///
  /// In en, this message translates to:
  /// **'Maternity'**
  String get maternity;

  /// No description provided for @paternity.
  ///
  /// In en, this message translates to:
  /// **'Paternity'**
  String get paternity;

  /// No description provided for @unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaid;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @appliedOn.
  ///
  /// In en, this message translates to:
  /// **'Applied on'**
  String get appliedOn;

  /// No description provided for @leaveType.
  ///
  /// In en, this message translates to:
  /// **'Leave Type'**
  String get leaveType;

  /// No description provided for @selectLeaveType.
  ///
  /// In en, this message translates to:
  /// **'Please select a leave type'**
  String get selectLeaveType;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @availablePlacements.
  ///
  /// In en, this message translates to:
  /// **'Available Placements'**
  String get availablePlacements;

  /// No description provided for @noPlacementsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No placements available at the moment.'**
  String get noPlacementsAvailable;

  /// No description provided for @placementDetails.
  ///
  /// In en, this message translates to:
  /// **'Placement Details'**
  String get placementDetails;

  /// No description provided for @postedOn.
  ///
  /// In en, this message translates to:
  /// **'Posted On'**
  String get postedOn;

  /// No description provided for @deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get deadline;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @requiredExperience.
  ///
  /// In en, this message translates to:
  /// **'Required Experience'**
  String get requiredExperience;

  /// No description provided for @noApplicants.
  ///
  /// In en, this message translates to:
  /// **'No Applicants'**
  String get noApplicants;

  /// No description provided for @noApplicantsForPlacement.
  ///
  /// In en, this message translates to:
  /// **'There are no applicants for this placement yet.'**
  String get noApplicantsForPlacement;

  /// No description provided for @applicants.
  ///
  /// In en, this message translates to:
  /// **'Applicants'**
  String get applicants;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContact;

  /// No description provided for @editContact.
  ///
  /// In en, this message translates to:
  /// **'Edit Contact'**
  String get editContact;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get relationship;

  /// No description provided for @selectRelationship.
  ///
  /// In en, this message translates to:
  /// **'Select Relationship'**
  String get selectRelationship;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @cityIsRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get cityIsRequired;

  /// No description provided for @addDependant.
  ///
  /// In en, this message translates to:
  /// **'Add Dependant'**
  String get addDependant;

  /// No description provided for @editDependant.
  ///
  /// In en, this message translates to:
  /// **'Edit Dependant'**
  String get editDependant;

  /// No description provided for @addEducation.
  ///
  /// In en, this message translates to:
  /// **'Add Education'**
  String get addEducation;

  /// No description provided for @editEducation.
  ///
  /// In en, this message translates to:
  /// **'Edit Education'**
  String get editEducation;

  /// No description provided for @institution.
  ///
  /// In en, this message translates to:
  /// **'Institution'**
  String get institution;

  /// No description provided for @institutionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Institution is required'**
  String get institutionIsRequired;

  /// No description provided for @fieldOfStudy.
  ///
  /// In en, this message translates to:
  /// **'Field of Study'**
  String get fieldOfStudy;

  /// No description provided for @selectFieldOfStudy.
  ///
  /// In en, this message translates to:
  /// **'Select Field of Study'**
  String get selectFieldOfStudy;

  /// No description provided for @gpa.
  ///
  /// In en, this message translates to:
  /// **'GPA'**
  String get gpa;

  /// No description provided for @gpaIsRequired.
  ///
  /// In en, this message translates to:
  /// **'GPA is required'**
  String get gpaIsRequired;

  /// No description provided for @addExperience.
  ///
  /// In en, this message translates to:
  /// **'Add Experience'**
  String get addExperience;

  /// No description provided for @editExperience.
  ///
  /// In en, this message translates to:
  /// **'Edit Experience'**
  String get editExperience;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @companyIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Company is required'**
  String get companyIsRequired;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get jobTitle;

  /// No description provided for @jobTitleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Job Title is required'**
  String get jobTitleIsRequired;

  /// No description provided for @yearsOfExperience.
  ///
  /// In en, this message translates to:
  /// **'Years of Experience'**
  String get yearsOfExperience;

  /// No description provided for @yearsOfExpRequired.
  ///
  /// In en, this message translates to:
  /// **'Years of experience is required'**
  String get yearsOfExpRequired;

  /// No description provided for @addSpouse.
  ///
  /// In en, this message translates to:
  /// **'Add Spouse'**
  String get addSpouse;

  /// No description provided for @editSpouse.
  ///
  /// In en, this message translates to:
  /// **'Edit Spouse'**
  String get editSpouse;

  /// No description provided for @editPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit Personal Info'**
  String get editPersonalInfo;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @noContactsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No contacts available. Please add one.'**
  String get noContactsAvailable;

  /// No description provided for @addNewContact.
  ///
  /// In en, this message translates to:
  /// **'Add New Contact'**
  String get addNewContact;

  /// No description provided for @dependants.
  ///
  /// In en, this message translates to:
  /// **'Dependants'**
  String get dependants;

  /// No description provided for @noDependantsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No dependants available. Please add one.'**
  String get noDependantsAvailable;

  /// No description provided for @addNewDependant.
  ///
  /// In en, this message translates to:
  /// **'Add New Dependant'**
  String get addNewDependant;

  /// No description provided for @noDocumentsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No documents available.'**
  String get noDocumentsAvailable;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @noEducationAvailable.
  ///
  /// In en, this message translates to:
  /// **'No education history available. Please add one.'**
  String get noEducationAvailable;

  /// No description provided for @addNewEducation.
  ///
  /// In en, this message translates to:
  /// **'Add New Education'**
  String get addNewEducation;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @noExperienceAvailable.
  ///
  /// In en, this message translates to:
  /// **'No work experience available. Please add one.'**
  String get noExperienceAvailable;

  /// No description provided for @addNewExperience.
  ///
  /// In en, this message translates to:
  /// **'Add New Experience'**
  String get addNewExperience;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @noPerformanceData.
  ///
  /// In en, this message translates to:
  /// **'No performance data available.'**
  String get noPerformanceData;

  /// No description provided for @middleName.
  ///
  /// In en, this message translates to:
  /// **'Middle Name'**
  String get middleName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @bloodGroup.
  ///
  /// In en, this message translates to:
  /// **'Blood Group'**
  String get bloodGroup;

  /// No description provided for @religion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get religion;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @spouse.
  ///
  /// In en, this message translates to:
  /// **'Spouse'**
  String get spouse;

  /// No description provided for @noSpouseAvailable.
  ///
  /// In en, this message translates to:
  /// **'No spouse information available. Please add one.'**
  String get noSpouseAvailable;

  /// No description provided for @addNewSpouse.
  ///
  /// In en, this message translates to:
  /// **'Add New Spouse'**
  String get addNewSpouse;

  /// No description provided for @promotionRequests.
  ///
  /// In en, this message translates to:
  /// **'Promotion Requests'**
  String get promotionRequests;

  /// No description provided for @noPromotionRequests.
  ///
  /// In en, this message translates to:
  /// **'No promotion requests found.'**
  String get noPromotionRequests;

  /// No description provided for @requestPromotion.
  ///
  /// In en, this message translates to:
  /// **'Request Promotion'**
  String get requestPromotion;

  /// No description provided for @currentPosition.
  ///
  /// In en, this message translates to:
  /// **'Current Position'**
  String get currentPosition;

  /// No description provided for @currentPositionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Current position is required'**
  String get currentPositionIsRequired;

  /// No description provided for @promotedPosition.
  ///
  /// In en, this message translates to:
  /// **'Position to be Promoted To'**
  String get promotedPosition;

  /// No description provided for @promotedPositionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Promoted position is required'**
  String get promotedPositionIsRequired;

  /// No description provided for @promotionDate.
  ///
  /// In en, this message translates to:
  /// **'Promotion Date'**
  String get promotionDate;

  /// No description provided for @availableTrainings.
  ///
  /// In en, this message translates to:
  /// **'Available Trainings'**
  String get availableTrainings;

  /// No description provided for @noTrainingsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No trainings available at the moment.'**
  String get noTrainingsAvailable;

  /// No description provided for @trainingDetails.
  ///
  /// In en, this message translates to:
  /// **'Training Details'**
  String get trainingDetails;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @noApplicantsForTraining.
  ///
  /// In en, this message translates to:
  /// **'There are no applicants for this training yet.'**
  String get noApplicantsForTraining;

  /// No description provided for @myTransferRequests.
  ///
  /// In en, this message translates to:
  /// **'My Transfer Requests'**
  String get myTransferRequests;

  /// No description provided for @noTransferRequests.
  ///
  /// In en, this message translates to:
  /// **'No transfer requests found.'**
  String get noTransferRequests;

  /// No description provided for @requestTransfer.
  ///
  /// In en, this message translates to:
  /// **'Request Transfer'**
  String get requestTransfer;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @fromDepartment.
  ///
  /// In en, this message translates to:
  /// **'From Department'**
  String get fromDepartment;

  /// No description provided for @fromDepartmentIsRequired.
  ///
  /// In en, this message translates to:
  /// **'From department is required'**
  String get fromDepartmentIsRequired;

  /// No description provided for @toDepartment.
  ///
  /// In en, this message translates to:
  /// **'To Department'**
  String get toDepartment;

  /// No description provided for @toDepartmentIsRequired.
  ///
  /// In en, this message translates to:
  /// **'To department is required'**
  String get toDepartmentIsRequired;

  /// No description provided for @requestDetails.
  ///
  /// In en, this message translates to:
  /// **'Request Details'**
  String get requestDetails;

  /// No description provided for @employeeIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get employeeIdLabel;

  /// No description provided for @transferDate.
  ///
  /// In en, this message translates to:
  /// **'Transfer Date'**
  String get transferDate;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQrCode;

  /// No description provided for @scanToVerify.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR code to verify employee details'**
  String get scanToVerify;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @invalidQrCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR Code'**
  String get invalidQrCode;

  /// No description provided for @employeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Employee Details'**
  String get employeeDetails;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @employmentDate.
  ///
  /// In en, this message translates to:
  /// **'Employment Date'**
  String get employmentDate;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @notVerified.
  ///
  /// In en, this message translates to:
  /// **'Not Verified'**
  String get notVerified;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @areYouSureLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureLogout;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @areYouSureDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get areYouSureDelete;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @selectFile.
  ///
  /// In en, this message translates to:
  /// **'Select File'**
  String get selectFile;

  /// No description provided for @noFileSelected.
  ///
  /// In en, this message translates to:
  /// **'No file selected'**
  String get noFileSelected;

  /// No description provided for @applicationStatus.
  ///
  /// In en, this message translates to:
  /// **'Application Status'**
  String get applicationStatus;

  /// No description provided for @applied.
  ///
  /// In en, this message translates to:
  /// **'Applied'**
  String get applied;

  /// No description provided for @underReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get underReview;

  /// No description provided for @shortlisted.
  ///
  /// In en, this message translates to:
  /// **'Shortlisted'**
  String get shortlisted;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @applicationDeadline.
  ///
  /// In en, this message translates to:
  /// **'Application Deadline'**
  String get applicationDeadline;

  /// No description provided for @viewApplicants.
  ///
  /// In en, this message translates to:
  /// **'View Applicants'**
  String get viewApplicants;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @amharic.
  ///
  /// In en, this message translates to:
  /// **'Amharic'**
  String get amharic;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// No description provided for @selectGender.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get single;

  /// No description provided for @married.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get married;

  /// No description provided for @divorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get divorced;

  /// No description provided for @widowed.
  ///
  /// In en, this message translates to:
  /// **'Widowed'**
  String get widowed;

  /// No description provided for @confirmDeleteItem.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {itemName}?'**
  String confirmDeleteItem({required String itemName});

  /// No description provided for @fileIsRequired.
  ///
  /// In en, this message translates to:
  /// **'File is required'**
  String get fileIsRequired;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @clearanceRequestSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Clearance request submitted successfully'**
  String get clearanceRequestSubmitted;

  /// No description provided for @failedToSubmitRequest.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit request: '**
  String get failedToSubmitRequest;

  /// No description provided for @reasonForClearance.
  ///
  /// In en, this message translates to:
  /// **'Reason for Clearance'**
  String get reasonForClearance;

  /// No description provided for @pleaseSelectReason.
  ///
  /// In en, this message translates to:
  /// **'Please select a reason'**
  String get pleaseSelectReason;

  /// No description provided for @lastDayOfWorkLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Day of Work'**
  String get lastDayOfWorkLabel;

  /// No description provided for @lastDayOfWork.
  ///
  /// In en, this message translates to:
  /// **'Last Day of Work: {date}'**
  String lastDayOfWork({required String date});

  /// No description provided for @pleaseSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Please select a date'**
  String get pleaseSelectDate;

  /// No description provided for @commentsOptional.
  ///
  /// In en, this message translates to:
  /// **'Comments (Optional)'**
  String get commentsOptional;

  /// No description provided for @provideAdditionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide any additional details.'**
  String get provideAdditionalDetails;

  /// No description provided for @requestedOn.
  ///
  /// In en, this message translates to:
  /// **'Requested On: {date}'**
  String requestedOn({required String date});

  /// No description provided for @welcomeBackUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}!'**
  String welcomeBackUser({required String name});

  /// No description provided for @totalEmployees.
  ///
  /// In en, this message translates to:
  /// **'Total Employees'**
  String get totalEmployees;

  /// No description provided for @pendingTasks.
  ///
  /// In en, this message translates to:
  /// **'Pending Tasks'**
  String get pendingTasks;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @leaveRequestApproved.
  ///
  /// In en, this message translates to:
  /// **'Leave Request Approved'**
  String get leaveRequestApproved;

  /// No description provided for @annualLeaveFor.
  ///
  /// In en, this message translates to:
  /// **'Annual leave for {name} from {dateRange}.'**
  String annualLeaveFor({required String name, required String dateRange});

  /// No description provided for @newPromotionRequest.
  ///
  /// In en, this message translates to:
  /// **'New Promotion Request'**
  String get newPromotionRequest;

  /// No description provided for @fromToPosition.
  ///
  /// In en, this message translates to:
  /// **'From {currentRank} {name} for {newPosition} position.'**
  String fromToPosition({
    required String currentRank,
    required String name,
    required String newPosition,
  });

  /// No description provided for @resignationSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Resignation Submitted'**
  String get resignationSubmitted;

  /// No description provided for @byEffective.
  ///
  /// In en, this message translates to:
  /// **'By {rank} {name}, effective {date}.'**
  String byEffective({
    required String rank,
    required String name,
    required String date,
  });

  /// No description provided for @twoHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'2h ago'**
  String get twoHoursAgo;

  /// No description provided for @eightHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'8h ago'**
  String get eightHoursAgo;

  /// No description provided for @oneDayAgo.
  ///
  /// In en, this message translates to:
  /// **'1d ago'**
  String get oneDayAgo;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @training.
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get training;

  /// No description provided for @placement.
  ///
  /// In en, this message translates to:
  /// **'Placement'**
  String get placement;

  /// No description provided for @clearance.
  ///
  /// In en, this message translates to:
  /// **'Clearance'**
  String get clearance;

  /// No description provided for @incident.
  ///
  /// In en, this message translates to:
  /// **'Incident'**
  String get incident;

  /// No description provided for @promotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get promotion;

  /// No description provided for @confirmAction.
  ///
  /// In en, this message translates to:
  /// **'Confirm Action'**
  String get confirmAction;

  /// No description provided for @confirmRecruitAction.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to {status} {count} recruit(s)? This action cannot be undone.'**
  String confirmRecruitAction({required String status, required int count});

  /// No description provided for @recruitIdentifier.
  ///
  /// In en, this message translates to:
  /// **'{firstName} {middleName} (ID: {id})'**
  String recruitIdentifier({
    required String firstName,
    required String middleName,
    required int id,
  });

  /// No description provided for @statusUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Status updated successfully!'**
  String get statusUpdatedSuccessfully;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processing;

  /// No description provided for @confirmStatus.
  ///
  /// In en, this message translates to:
  /// **'Confirm {status}'**
  String confirmStatus({required String status});

  /// No description provided for @pass.
  ///
  /// In en, this message translates to:
  /// **'Pass'**
  String get pass;

  /// No description provided for @fail.
  ///
  /// In en, this message translates to:
  /// **'Fail'**
  String get fail;

  /// No description provided for @itemsSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String itemsSelected({required int count});

  /// No description provided for @selectRecruitsToContinue.
  ///
  /// In en, this message translates to:
  /// **'Select recruits to continue'**
  String get selectRecruitsToContinue;

  /// No description provided for @markAll.
  ///
  /// In en, this message translates to:
  /// **'Mark All'**
  String get markAll;

  /// No description provided for @unmarkAll.
  ///
  /// In en, this message translates to:
  /// **'Unmark All'**
  String get unmarkAll;

  /// No description provided for @addNewRecruit.
  ///
  /// In en, this message translates to:
  /// **'Add New Recruit'**
  String get addNewRecruit;

  /// No description provided for @newRecruitApplication.
  ///
  /// In en, this message translates to:
  /// **'New Recruit Application'**
  String get newRecruitApplication;

  /// No description provided for @recruitmentAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Recruitment Announcement'**
  String get recruitmentAnnouncement;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @numberOfChildren.
  ///
  /// In en, this message translates to:
  /// **'Number of Children'**
  String get numberOfChildren;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @woreda.
  ///
  /// In en, this message translates to:
  /// **'Woreda'**
  String get woreda;

  /// No description provided for @kebele.
  ///
  /// In en, this message translates to:
  /// **'Kebele'**
  String get kebele;

  /// No description provided for @houseNumber.
  ///
  /// In en, this message translates to:
  /// **'House Number'**
  String get houseNumber;

  /// No description provided for @reportNewIncident.
  ///
  /// In en, this message translates to:
  /// **'Report New Incident'**
  String get reportNewIncident;

  /// No description provided for @pleaseSelectIncidentDate.
  ///
  /// In en, this message translates to:
  /// **'Please select the incident date'**
  String get pleaseSelectIncidentDate;

  /// No description provided for @pleaseSelectAnIncidentType.
  ///
  /// In en, this message translates to:
  /// **'Please select an incident type'**
  String get pleaseSelectAnIncidentType;

  /// No description provided for @descriptionOfIncident.
  ///
  /// In en, this message translates to:
  /// **'Description of Incident'**
  String get descriptionOfIncident;

  /// No description provided for @provideClearDetailedDescription.
  ///
  /// In en, this message translates to:
  /// **'Please provide a clear and detailed description of the incident.'**
  String get provideClearDetailedDescription;

  /// No description provided for @submitReport.
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get submitReport;

  /// No description provided for @incidentReportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Incident report submitted successfully'**
  String get incidentReportSubmitted;

  /// No description provided for @failedToSubmitReport.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit report:'**
  String get failedToSubmitReport;

  /// No description provided for @incidentAndGrievance.
  ///
  /// In en, this message translates to:
  /// **'Incident & Grievance'**
  String get incidentAndGrievance;

  /// No description provided for @noIncidentsToDisplay.
  ///
  /// In en, this message translates to:
  /// **'No incidents to display.'**
  String get noIncidentsToDisplay;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date: {date}'**
  String dateLabel({required String date});

  /// No description provided for @annualLeave.
  ///
  /// In en, this message translates to:
  /// **'Annual Leave'**
  String get annualLeave;

  /// No description provided for @sickLeave.
  ///
  /// In en, this message translates to:
  /// **'Sick Leave'**
  String get sickLeave;

  /// No description provided for @noBalanceInfoAvailable.
  ///
  /// In en, this message translates to:
  /// **'No balance information available.'**
  String get noBalanceInfoAvailable;

  /// No description provided for @requestHistory.
  ///
  /// In en, this message translates to:
  /// **'Request History'**
  String get requestHistory;

  /// No description provided for @newLeaveRequest.
  ///
  /// In en, this message translates to:
  /// **'New Leave Request'**
  String get newLeaveRequest;

  /// No description provided for @requestNewLeave.
  ///
  /// In en, this message translates to:
  /// **'Request New Leave'**
  String get requestNewLeave;

  /// No description provided for @pleaseSelectLeaveType.
  ///
  /// In en, this message translates to:
  /// **'Please select a leave type'**
  String get pleaseSelectLeaveType;

  /// No description provided for @selectLeaveTypeToSeeBalance.
  ///
  /// In en, this message translates to:
  /// **'Select a leave type to see balance'**
  String get selectLeaveTypeToSeeBalance;

  /// No description provided for @availableDays.
  ///
  /// In en, this message translates to:
  /// **'Available: {days} days'**
  String availableDays({required int days});

  /// No description provided for @availableOfTotalDays.
  ///
  /// In en, this message translates to:
  /// **'Available: {remaining} of {total} days'**
  String availableOfTotalDays({required int remaining, required int total});

  /// No description provided for @pleaseSelectStartDate.
  ///
  /// In en, this message translates to:
  /// **'Please select a start date'**
  String get pleaseSelectStartDate;

  /// No description provided for @pleaseSelectEndDate.
  ///
  /// In en, this message translates to:
  /// **'Please select an end date'**
  String get pleaseSelectEndDate;

  /// No description provided for @endDateAfterStartDate.
  ///
  /// In en, this message translates to:
  /// **'End date must be after start date'**
  String get endDateAfterStartDate;

  /// No description provided for @reasonForLeave.
  ///
  /// In en, this message translates to:
  /// **'Reason for Leave'**
  String get reasonForLeave;

  /// No description provided for @leaveTitle.
  ///
  /// In en, this message translates to:
  /// **'{leaveType} Leave'**
  String leaveTitle({required String leaveType});

  /// No description provided for @fromLabel.
  ///
  /// In en, this message translates to:
  /// **'From:'**
  String get fromLabel;

  /// No description provided for @toLabel.
  ///
  /// In en, this message translates to:
  /// **'To:'**
  String get toLabel;

  /// No description provided for @daysWithReason.
  ///
  /// In en, this message translates to:
  /// **'{days} Day(s) - {reason}'**
  String daysWithReason({required int days, required String reason});

  /// No description provided for @daysOnly.
  ///
  /// In en, this message translates to:
  /// **'{count} Day(s)'**
  String daysOnly({required int count});

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **' Days Left'**
  String get daysLeft;

  /// No description provided for @usedOf.
  ///
  /// In en, this message translates to:
  /// **'Used: {used} of {allowed}'**
  String usedOf({required int used, required int allowed});

  /// No description provided for @applicationSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Application submitted successfully!'**
  String get applicationSubmittedSuccessfully;

  /// No description provided for @submitAppeal.
  ///
  /// In en, this message translates to:
  /// **'Submit Appeal'**
  String get submitAppeal;

  /// No description provided for @reasonForAppeal.
  ///
  /// In en, this message translates to:
  /// **'Reason for Appeal'**
  String get reasonForAppeal;

  /// No description provided for @appealSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Appeal submitted.'**
  String get appealSubmitted;

  /// No description provided for @failedToSubmitAppeal.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit appeal.'**
  String get failedToSubmitAppeal;

  /// No description provided for @selectedApplicants.
  ///
  /// In en, this message translates to:
  /// **'Selected Applicants'**
  String get selectedApplicants;

  /// No description provided for @placementNotFound.
  ///
  /// In en, this message translates to:
  /// **'Placement not found.'**
  String get placementNotFound;

  /// No description provided for @applyForThisPlacement.
  ///
  /// In en, this message translates to:
  /// **'Apply for this Placement'**
  String get applyForThisPlacement;

  /// No description provided for @reasonForApplyingOptional.
  ///
  /// In en, this message translates to:
  /// **'Reason for Applying (Optional)'**
  String get reasonForApplyingOptional;

  /// No description provided for @submitApplication.
  ///
  /// In en, this message translates to:
  /// **'Submit Application'**
  String get submitApplication;

  /// No description provided for @noSelectedApplicantInfo.
  ///
  /// In en, this message translates to:
  /// **'No information on selected applicants is available.'**
  String get noSelectedApplicantInfo;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// No description provided for @noPromotionRequestsFound.
  ///
  /// In en, this message translates to:
  /// **'No promotion requests found.'**
  String get noPromotionRequestsFound;

  /// No description provided for @promotionRequestSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Promotion request submitted successfully'**
  String get promotionRequestSubmitted;

  /// No description provided for @requestedPositionForPromotion.
  ///
  /// In en, this message translates to:
  /// **'Requested Position for Promotion'**
  String get requestedPositionForPromotion;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @reasonForRequest.
  ///
  /// In en, this message translates to:
  /// **'Reason for Request'**
  String get reasonForRequest;

  /// No description provided for @brieflyExplainPromotionReason.
  ///
  /// In en, this message translates to:
  /// **'Briefly explain why you are requesting this promotion.'**
  String get brieflyExplainPromotionReason;

  /// No description provided for @pleaseProvideReason.
  ///
  /// In en, this message translates to:
  /// **'Please provide a reason'**
  String get pleaseProvideReason;

  /// No description provided for @requestForPromotion.
  ///
  /// In en, this message translates to:
  /// **'Request for Promotion'**
  String get requestForPromotion;

  /// No description provided for @requestedLabel.
  ///
  /// In en, this message translates to:
  /// **'Requested: {date}'**
  String requestedLabel({required String date});

  /// No description provided for @trainingNotFound.
  ///
  /// In en, this message translates to:
  /// **'Training not found.'**
  String get trainingNotFound;

  /// No description provided for @applyForThisTraining.
  ///
  /// In en, this message translates to:
  /// **'Apply for this Training'**
  String get applyForThisTraining;

  /// No description provided for @trainingLocationAndOrganizer.
  ///
  /// In en, this message translates to:
  /// **'{center} by {organizer}'**
  String trainingLocationAndOrganizer({
    required String center,
    required String organizer,
  });

  /// No description provided for @noTransferRequestsYet.
  ///
  /// In en, this message translates to:
  /// **'You have not submitted any transfer requests yet.'**
  String get noTransferRequestsYet;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @transferRequestDetails.
  ///
  /// In en, this message translates to:
  /// **'Transfer Request Details'**
  String get transferRequestDetails;

  /// No description provided for @requestId.
  ///
  /// In en, this message translates to:
  /// **'Request ID'**
  String get requestId;

  /// No description provided for @currentDepartment.
  ///
  /// In en, this message translates to:
  /// **'Current Department'**
  String get currentDepartment;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @requestedDepartment.
  ///
  /// In en, this message translates to:
  /// **'Requested Department'**
  String get requestedDepartment;

  /// No description provided for @requestedLocation.
  ///
  /// In en, this message translates to:
  /// **'Requested Location'**
  String get requestedLocation;

  /// No description provided for @requestedPosition.
  ///
  /// In en, this message translates to:
  /// **'Requested Position'**
  String get requestedPosition;

  /// No description provided for @managerComments.
  ///
  /// In en, this message translates to:
  /// **'Manager Comments'**
  String get managerComments;

  /// No description provided for @hrComments.
  ///
  /// In en, this message translates to:
  /// **'HR Comments'**
  String get hrComments;

  /// No description provided for @effectiveDate.
  ///
  /// In en, this message translates to:
  /// **'Effective Date'**
  String get effectiveDate;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @confirmCancellation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cancellation'**
  String get confirmCancellation;

  /// No description provided for @confirmCancelTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel your transfer request to {location}?'**
  String confirmCancelTransferRequest({required String location});

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// No description provided for @pleaseCorrectErrorsInForm.
  ///
  /// In en, this message translates to:
  /// **'Please correct the errors in the form.'**
  String get pleaseCorrectErrorsInForm;

  /// No description provided for @currentEmployeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Current Employee Details:'**
  String get currentEmployeeDetails;

  /// No description provided for @newTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'New Transfer Request:'**
  String get newTransferRequest;

  /// No description provided for @requestedDepartmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Requested Department *'**
  String get requestedDepartmentLabel;

  /// No description provided for @requestedDepartmentHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., CID, Traffic Police, HR'**
  String get requestedDepartmentHint;

  /// No description provided for @requestedDepartmentRequired.
  ///
  /// In en, this message translates to:
  /// **'Requested department is required.'**
  String get requestedDepartmentRequired;

  /// No description provided for @requestedLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Requested Location *'**
  String get requestedLocationLabel;

  /// No description provided for @requestedLocationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Gondar Zonal Office, Bahir Dar City'**
  String get requestedLocationHint;

  /// No description provided for @requestedLocationRequired.
  ///
  /// In en, this message translates to:
  /// **'Requested location is required.'**
  String get requestedLocationRequired;

  /// No description provided for @requestedPositionTitleOptional.
  ///
  /// In en, this message translates to:
  /// **'Requested Position Title (Optional)'**
  String get requestedPositionTitleOptional;

  /// No description provided for @requestedPositionTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Investigator, Trainer'**
  String get requestedPositionTitleHint;

  /// No description provided for @reasonForRequestLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason for Request *'**
  String get reasonForRequestLabel;

  /// No description provided for @reasonForRequestHint.
  ///
  /// In en, this message translates to:
  /// **'Provide a detailed reason for your transfer request.'**
  String get reasonForRequestHint;

  /// No description provided for @reasonForRequestRequired.
  ///
  /// In en, this message translates to:
  /// **'Reason for request is required.'**
  String get reasonForRequestRequired;

  /// No description provided for @submitTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit Transfer Request'**
  String get submitTransferRequest;

  /// No description provided for @requestTo.
  ///
  /// In en, this message translates to:
  /// **'Request to: {department}'**
  String requestTo({required String department});

  /// No description provided for @submittedOn.
  ///
  /// In en, this message translates to:
  /// **'Submitted: {date}'**
  String submittedOn({required String date});

  /// No description provided for @verificationError.
  ///
  /// In en, this message translates to:
  /// **'Verification Error'**
  String get verificationError;

  /// No description provided for @enterEmployeeId.
  ///
  /// In en, this message translates to:
  /// **'Enter Employee ID'**
  String get enterEmployeeId;

  /// No description provided for @employeeIdHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., EMP-001'**
  String get employeeIdHint;

  /// No description provided for @qrCodeScanned.
  ///
  /// In en, this message translates to:
  /// **'QR Code Scanned'**
  String get qrCodeScanned;

  /// No description provided for @searchingForEmployee.
  ///
  /// In en, this message translates to:
  /// **'Searching for employee: {qrCode}'**
  String searchingForEmployee({required String qrCode});

  /// No description provided for @verifyNew.
  ///
  /// In en, this message translates to:
  /// **'Verify New'**
  String get verifyNew;

  /// No description provided for @verifyingEmployee.
  ///
  /// In en, this message translates to:
  /// **'Verifying employee...'**
  String get verifyingEmployee;

  /// No description provided for @readyToVerify.
  ///
  /// In en, this message translates to:
  /// **'Ready to Verify'**
  String get readyToVerify;

  /// No description provided for @enterIdOrScanQr.
  ///
  /// In en, this message translates to:
  /// **'Enter an Employee ID or scan a QR code to begin.'**
  String get enterIdOrScanQr;

  /// No description provided for @retrySearch.
  ///
  /// In en, this message translates to:
  /// **'Retry Search'**
  String get retrySearch;

  /// No description provided for @scanEmployeeId.
  ///
  /// In en, this message translates to:
  /// **'Scan Employee ID'**
  String get scanEmployeeId;

  /// No description provided for @hiredOn.
  ///
  /// In en, this message translates to:
  /// **'Hired On'**
  String get hiredOn;

  /// No description provided for @clearFile.
  ///
  /// In en, this message translates to:
  /// **'Clear file'**
  String get clearFile;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @noItemsAdded.
  ///
  /// In en, this message translates to:
  /// **'No items added yet.'**
  String get noItemsAdded;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @amharicNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Amharic language is not available yet'**
  String get amharicNotAvailable;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @hiredDate.
  ///
  /// In en, this message translates to:
  /// **'Hired Date'**
  String get hiredDate;

  /// No description provided for @employmentStatus.
  ///
  /// In en, this message translates to:
  /// **'Employment Status'**
  String get employmentStatus;

  /// No description provided for @editPersonalDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Personal Details'**
  String get editPersonalDetails;

  /// No description provided for @noPerformanceReviews.
  ///
  /// In en, this message translates to:
  /// **'No performance reviews available.'**
  String get noPerformanceReviews;

  /// No description provided for @reviewDate.
  ///
  /// In en, this message translates to:
  /// **'Review Date: {date}'**
  String reviewDate({required String date});

  /// No description provided for @ratingAndComments.
  ///
  /// In en, this message translates to:
  /// **'Rating: {rating} - {comments}'**
  String ratingAndComments({required double rating, required String comments});

  /// No description provided for @noComments.
  ///
  /// In en, this message translates to:
  /// **'No comments'**
  String get noComments;

  /// No description provided for @spouseInformation.
  ///
  /// In en, this message translates to:
  /// **'Spouse Information'**
  String get spouseInformation;

  /// No description provided for @noSpouseInfoAvailable.
  ///
  /// In en, this message translates to:
  /// **'No spouse information available.'**
  String get noSpouseInfoAvailable;

  /// No description provided for @occupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation: {occupation}'**
  String occupation({required String occupation});

  /// No description provided for @dobLabel.
  ///
  /// In en, this message translates to:
  /// **'DOB: {dob}'**
  String dobLabel({required String dob});

  /// No description provided for @updated.
  ///
  /// In en, this message translates to:
  /// **'updated'**
  String get updated;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'added'**
  String get added;

  /// No description provided for @present.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get present;

  /// No description provided for @experienceSuccess.
  ///
  /// In en, this message translates to:
  /// **'Experience successfully {action}.'**
  String experienceSuccess({required String action});

  /// No description provided for @failedToExperience.
  ///
  /// In en, this message translates to:
  /// **'Failed to {action} experience.'**
  String failedToExperience({required String action});

  /// No description provided for @experienceDeleted.
  ///
  /// In en, this message translates to:
  /// **'Experience successfully deleted.'**
  String get experienceDeleted;

  /// No description provided for @failedToDeleteExperience.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete experience.'**
  String get failedToDeleteExperience;

  /// No description provided for @educationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Education successfully {action}.'**
  String educationSuccess({required String action});

  /// No description provided for @failedToEducation.
  ///
  /// In en, this message translates to:
  /// **'Failed to {action} education.'**
  String failedToEducation({required String action});

  /// No description provided for @educationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Education successfully deleted.'**
  String get educationDeleted;

  /// No description provided for @failedToDeleteEducation.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete education.'**
  String get failedToDeleteEducation;

  /// No description provided for @uploadedOn.
  ///
  /// In en, this message translates to:
  /// **'Uploaded: {date}'**
  String uploadedOn({required String date});

  /// No description provided for @noDependantsListed.
  ///
  /// In en, this message translates to:
  /// **'No dependants listed.'**
  String get noDependantsListed;

  /// No description provided for @relationLabel.
  ///
  /// In en, this message translates to:
  /// **'Relation: {relation}'**
  String relationLabel({required String relation});

  /// No description provided for @addEmergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Add Emergency Contact'**
  String get addEmergencyContact;

  /// No description provided for @emergencyContacts.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contacts'**
  String get emergencyContacts;

  /// No description provided for @noEmergencyContactsListed.
  ///
  /// In en, this message translates to:
  /// **'No emergency contacts listed.'**
  String get noEmergencyContactsListed;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone: {phone}'**
  String phoneLabel({required String phone});

  /// No description provided for @profileUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccessfully;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title (e.g., Mr., Mrs., Ms.) *'**
  String get titleLabel;

  /// No description provided for @titleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get titleIsRequired;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name *'**
  String get fullNameLabel;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender *'**
  String get genderLabel;

  /// No description provided for @genderIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Gender is required'**
  String get genderIsRequired;

  /// No description provided for @dateOfBirthLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth *'**
  String get dateOfBirthLabel;

  /// No description provided for @occupationLabel.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupationLabel;

  /// No description provided for @mothersFullName.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Full Name'**
  String get mothersFullName;

  /// No description provided for @addressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address *'**
  String get addressLabel;

  /// No description provided for @anniversaryDate.
  ///
  /// In en, this message translates to:
  /// **'Anniversary Date'**
  String get anniversaryDate;

  /// No description provided for @retirementNumber.
  ///
  /// In en, this message translates to:
  /// **'Retirement Number'**
  String get retirementNumber;

  /// No description provided for @tinNumber.
  ///
  /// In en, this message translates to:
  /// **'TIN Number'**
  String get tinNumber;

  /// No description provided for @organizationLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization *'**
  String get organizationLabel;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredField;

  /// No description provided for @organizationTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization Type *'**
  String get organizationTypeLabel;

  /// No description provided for @positionLabel.
  ///
  /// In en, this message translates to:
  /// **'Position *'**
  String get positionLabel;

  /// No description provided for @responsibilitiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Responsibilities'**
  String get responsibilitiesLabel;

  /// No description provided for @proficiencyLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Proficiency Level *'**
  String get proficiencyLevelLabel;

  /// No description provided for @joinDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Join Date *'**
  String get joinDateLabel;

  /// No description provided for @iCurrentlyWorkHere.
  ///
  /// In en, this message translates to:
  /// **'I currently work here'**
  String get iCurrentlyWorkHere;

  /// No description provided for @separationDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Separation Date'**
  String get separationDateLabel;

  /// No description provided for @educationLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Education Level *'**
  String get educationLevelLabel;

  /// No description provided for @universityLabel.
  ///
  /// In en, this message translates to:
  /// **'University *'**
  String get universityLabel;

  /// No description provided for @fieldOfStudyLabel.
  ///
  /// In en, this message translates to:
  /// **'Field Of Study *'**
  String get fieldOfStudyLabel;

  /// No description provided for @cgpa.
  ///
  /// In en, this message translates to:
  /// **'CGPA'**
  String get cgpa;

  /// No description provided for @startDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start Date *'**
  String get startDateLabel;

  /// No description provided for @startDateIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Start date is required'**
  String get startDateIsRequired;

  /// No description provided for @endDateLabel.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDateLabel;

  /// No description provided for @educationStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Education Status *'**
  String get educationStatusLabel;

  /// No description provided for @dependantsFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Dependant\'s Full Name *'**
  String get dependantsFullNameLabel;

  /// No description provided for @relationshipLabel.
  ///
  /// In en, this message translates to:
  /// **'Relationship *'**
  String get relationshipLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number *'**
  String get phoneNumberLabel;

  /// No description provided for @regionLabel.
  ///
  /// In en, this message translates to:
  /// **'Region *'**
  String get regionLabel;

  /// No description provided for @phoneLabelRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone *'**
  String get phoneLabelRequired;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @trainingAndDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Training & Development'**
  String get trainingAndDevelopment;

  /// No description provided for @placementManagement.
  ///
  /// In en, this message translates to:
  /// **'Placement Management'**
  String get placementManagement;

  /// No description provided for @employeeClearance.
  ///
  /// In en, this message translates to:
  /// **'Employee Clearance'**
  String get employeeClearance;

  /// No description provided for @incidentManagement.
  ///
  /// In en, this message translates to:
  /// **'Incident Management'**
  String get incidentManagement;

  /// No description provided for @promotionManagement.
  ///
  /// In en, this message translates to:
  /// **'Promotion Management'**
  String get promotionManagement;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'ID {id}'**
  String id({required String id});

  /// No description provided for @noLeaveHistoryFound.
  ///
  /// In en, this message translates to:
  /// **'No Leave History Found'**
  String get noLeaveHistoryFound;

  /// No description provided for @employeeId.
  ///
  /// In en, this message translates to:
  /// **'Employee ID {id}'**
  String employeeId({required String id});

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification Failed'**
  String get verificationFailed;

  /// No description provided for @googleSignInNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in is not implemented yet. Use email instead.'**
  String get googleSignInNotImplemented;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signupFailed.
  ///
  /// In en, this message translates to:
  /// **'Signup Failed'**
  String get signupFailed;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @userNamePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Dawit Worku'**
  String get userNamePlaceholder;

  /// No description provided for @userEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'dawit.worku@gmil.com'**
  String get userEmailPlaceholder;

  /// No description provided for @userInitialsPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'DD'**
  String get userInitialsPlaceholder;

  /// No description provided for @yourStatus.
  ///
  /// In en, this message translates to:
  /// **'Your Status'**
  String get yourStatus;

  /// No description provided for @reasonForNonSelection.
  ///
  /// In en, this message translates to:
  /// **'Reason for non-selection:'**
  String get reasonForNonSelection;

  /// No description provided for @noReasonProvided.
  ///
  /// In en, this message translates to:
  /// **'No reason provided.'**
  String get noReasonProvided;

  /// No description provided for @yourAppealIsUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Your appeal is under review.'**
  String get yourAppealIsUnderReview;

  /// No description provided for @viewSelected.
  ///
  /// In en, this message translates to:
  /// **'View Selected'**
  String get viewSelected;

  /// No description provided for @appealDecision.
  ///
  /// In en, this message translates to:
  /// **'Appeal Decision'**
  String get appealDecision;

  /// No description provided for @ethiopian.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian'**
  String get ethiopian;

  /// No description provided for @noPlacementsFound.
  ///
  /// In en, this message translates to:
  /// **'No Placements Found'**
  String get noPlacementsFound;

  /// No description provided for @transferTo.
  ///
  /// In en, this message translates to:
  /// **'Transfer To: {location}'**
  String transferTo({required String location});

  /// No description provided for @approvalDate.
  ///
  /// In en, this message translates to:
  /// **'Approval Date'**
  String get approvalDate;

  /// No description provided for @approvedBy.
  ///
  /// In en, this message translates to:
  /// **'Approved By'**
  String get approvedBy;

  /// A phrase indicating a number of years of experience.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{{count} year} other{{count} years}}'**
  String years({required int count});

  /// No description provided for @expiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires on'**
  String get expiresOn;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @confirmApplication.
  ///
  /// In en, this message translates to:
  /// **'Confirm Application'**
  String get confirmApplication;

  /// Confirmation message for applying to a placement.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to apply for the position of {position}?'**
  String confirmPlacementApplication({required String position});

  /// No description provided for @confirmAndApply.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Apply'**
  String get confirmAndApply;

  /// No description provided for @myPlacementApplications.
  ///
  /// In en, this message translates to:
  /// **'My Placement Applications'**
  String get myPlacementApplications;

  /// No description provided for @noApplicationsSubmitted.
  ///
  /// In en, this message translates to:
  /// **'You have not submitted any placement applications yet.'**
  String get noApplicationsSubmitted;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @verificationErrorNotFound.
  ///
  /// In en, this message translates to:
  /// **'No employee found with the specified ID.'**
  String get verificationErrorNotFound;

  /// No description provided for @serverConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Server Configuration'**
  String get serverConfiguration;

  /// No description provided for @connectToServer.
  ///
  /// In en, this message translates to:
  /// **'Connect to Server'**
  String get connectToServer;

  /// No description provided for @serverIpAddress.
  ///
  /// In en, this message translates to:
  /// **'Server IP Address'**
  String get serverIpAddress;

  /// No description provided for @serverIpAddressHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 192.168.1.10'**
  String get serverIpAddressHint;

  /// No description provided for @errorEnterIp.
  ///
  /// In en, this message translates to:
  /// **'Please enter an IP address'**
  String get errorEnterIp;

  /// No description provided for @errorInvalidIp.
  ///
  /// In en, this message translates to:
  /// **'Invalid IP address format'**
  String get errorInvalidIp;

  /// No description provided for @port.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get port;

  /// No description provided for @portHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 8000'**
  String get portHint;

  /// No description provided for @errorEnterPort.
  ///
  /// In en, this message translates to:
  /// **'Please enter a port number'**
  String get errorEnterPort;

  /// No description provided for @errorInvalidPort.
  ///
  /// In en, this message translates to:
  /// **'Port must be a number between 1 and 65535'**
  String get errorInvalidPort;

  /// No description provided for @saveAndConnect.
  ///
  /// In en, this message translates to:
  /// **'Save and Connect'**
  String get saveAndConnect;

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection Failed'**
  String get connectionFailed;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @editServerSettings.
  ///
  /// In en, this message translates to:
  /// **'Edit Server Settings'**
  String get editServerSettings;

  /// No description provided for @errorServerUnreachable.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server. Please check the IP, Port, and your network connection.'**
  String get errorServerUnreachable;

  /// No description provided for @errorConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'The connection timed out. The server may be slow to respond or offline.'**
  String get errorConnectionTimeout;

  /// No description provided for @errorUnexpectedResponse.
  ///
  /// In en, this message translates to:
  /// **'The server responded, but not in the way expected. Please verify the server address.'**
  String get errorUnexpectedResponse;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorGeneric;

  /// No description provided for @editLeaveRequest.
  ///
  /// In en, this message translates to:
  /// **'Edit Leave Request'**
  String get editLeaveRequest;

  /// No description provided for @changeServer.
  ///
  /// In en, this message translates to:
  /// **'Change Server'**
  String get changeServer;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetails;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
