// lib/features/recruitment/application/vacancy_list_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/employment_type_vacancy.dart';
import 'package:police_com/core/enums/vacancy_status.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/vacancy_list_state.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/vacancy_model.dart';

class VacancyListNotifier extends StateNotifier<VacancyListState> {
  // TODO: Inject actual API service
  // final YourVacancyApiService _apiService;

  VacancyListNotifier(/*this._apiService*/) : super(const VacancyListState()) {
    // Initialize with mock data when the notifier is created
    _allMockVacancies = _generateMockPoliceVacancies();
    // Apply initial filters (which will be default VacancyStatus.Open and empty search)
    _applyFiltersAndSearch();
  }

  // Store all fetched/mocked vacancies to allow client-side filtering/searching
  List<VacancyModel> _allMockVacancies = [];

  Future<void> fetchVacancies({bool isRefresh = false}) async {
    // This method can be called to explicitly re-fetch or re-initialize.
    // For mock data, it just re-generates and re-applies filters.
    if (state.isLoading && !isRefresh) return;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      // TODO: Replace with actual API call
      // final fetchedData = await _apiService.getVacancies(page: 1, status: state.filterStatus, query: state.searchQuery);
      await Future.delayed(
        const Duration(milliseconds: 300),
      ); // Simulate network delay for refresh

      _allMockVacancies =
          _generateMockPoliceVacancies(); // Re-generate fresh mock data
      _applyFiltersAndSearch(); // This will set isLoading to false
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void _applyFiltersAndSearch() {
    List<VacancyModel> filteredList = List.from(
      _allMockVacancies,
    ); // Start with a fresh copy

    // Apply status filter (default is Open)
    // For the mock, we'll assume the VacancyStatus enum in VacancyModel is what we filter by.
    // The backend's PostStatus might need mapping if it's different.
    filteredList =
        filteredList
            .where((vacancy) => vacancy.status == state.filterStatus)
            .toList();

    // Apply search query
    if (state.searchQuery.isNotEmpty) {
      final query = state.searchQuery.toLowerCase();
      filteredList =
          filteredList.where((vacancy) {
            return vacancy.positionTitle.toLowerCase().contains(query) ||
                vacancy.department.toLowerCase().contains(query) ||
                vacancy.location.toLowerCase().contains(query) ||
                (vacancy.keywords?.any(
                      (k) => k.toLowerCase().contains(query),
                    ) ??
                    false);
          }).toList();
    }
    // Simulate pagination for mock data if needed, for now, show all filtered
    state = state.copyWith(
      vacancies: filteredList,
      isLoading: false,
      errorMessage: null,
      currentPage: 0,
      canLoadMore: false,
    );
  }

  void setFilterStatus(VacancyStatus status) {
    state = state.copyWith(filterStatus: status, isLoading: true);
    _applyFiltersAndSearch();
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query, isLoading: true);
    _applyFiltersAndSearch();
  }

  List<VacancyModel> _generateMockPoliceVacancies() {
    // Using the updated VacancyModel with new fields
    return [
      VacancyModel(
        id: 'VAC001',
        positionTitle: 'Patrol Sergeant',
        department: 'Patrol Division - Unit A',
        location: 'Bahir Dar Central Station',
        description:
            'Supervise and coordinate patrol officers in assigned district. Ensure public safety, respond to incidents, and prepare operational reports. Requires strong leadership and decision-making skills under pressure.',
        responsibilities: [
          'Lead daily briefings and assign patrol routes',
          'Respond to and manage emergency calls and crime scenes',
          'Mentor and evaluate junior officers',
          'Prepare and submit detailed incident and operational reports',
          'Community engagement and problem-solving',
        ],
        qualifications: [
          'Minimum 5 years experience as Police Constable',
          'Completed Sergeant Promotion Course',
          'Valid driving license (Class B, C)',
          'Advanced firearm proficiency and tactical training',
          'First Aid/CPR certification',
        ],
        preferredQualifications: [
          'Degree in Criminology or Law Enforcement',
          'Experience in a supervisory role',
        ],
        employmentType: EmploymentTypeVacancy.fullTime,
        numberOfOpenings: 2,
        postingDate: DateTime.now().subtract(const Duration(days: 10)),
        closingDate: DateTime.now().add(const Duration(days: 20)),
        positionGrade: 'SGT-II',
        gradeSalary: 18500.00,
        salaryRange: 'ETB 18,000 - ETB 22,000 (based on experience)',
        applicationProcedure:
            'Submit CV, academic credentials, and service letter through the internal HR portal or to the Regional HR Office. Reference VAC001.',
        contactEmail: 'hr.recruitment@amaharapolice.gov.et',
        contactPhone: '058-xxx-xxxx ext 102',
        reportingToPositionId: 'CAP001', // Captain ID
        keywords: [
          'sergeant',
          'patrol',
          'supervisor',
          'law enforcement',
          'field operations',
        ],
        internalNotes: 'Priority filling for Zone 1 operations.',
      ),
      VacancyModel(
        id: 'VAC002',
        positionTitle: 'Forensic Analyst (Ballistics)',
        department: 'Criminal Investigation Department (CID) - Forensics Unit',
        location: 'Regional Forensics Lab, Bahir Dar',
        description:
            'Collect, process, and analyze ballistics evidence from crime scenes. Prepare detailed forensic reports and testify in court as required. Maintain integrity of evidence and laboratory equipment.',
        responsibilities: [
          'Examine firearms and ammunition components',
          'Conduct GSR analysis',
          'Reconstruct shooting incidents',
          'Maintain detailed case files and evidence logs',
          'Testify as an expert witness',
        ],
        qualifications: [
          'BSc in Forensic Science, Chemistry, or Physics',
          'Minimum 3 years experience in a ballistics lab',
          'Proficiency with comparison microscopes and analysis software',
          'Strong attention to detail and analytical skills',
        ],
        preferredQualifications: [
          'MSc in Forensic Ballistics',
          'Certification from a recognized forensic body',
        ],
        employmentType: EmploymentTypeVacancy.fullTime,
        postingDate: DateTime.now().subtract(const Duration(days: 5)),
        closingDate: DateTime.now().add(const Duration(days: 25)),
        positionGrade: 'FNS-SPC-3',
        gradeSalary: 22000.00,
        salaryRange: 'ETB 20,000 - ETB 25,000',
        applicationProcedure:
            'Apply online via the Commission\'s career portal with certified copies of degrees and experience letters. Quote VAC002.',
        contactEmail: 'cid.forensics@amaharapolice.gov.et',
        keywords: [
          'forensics',
          'ballistics',
          'analyst',
          'laboratory',
          'cid',
          'evidence',
          'crime scene',
        ],
      ),
      VacancyModel(
        id: 'VAC003',
        positionTitle: 'Community Policing Constable',
        department: 'Community Relations Division - Zone B',
        location: 'Gondar - Kebele 10 Community Center',
        description:
            'Proactively engage with community members to build trust and cooperation. Implement community safety programs, address local concerns, and support crime prevention initiatives.',
        responsibilities: [
          'Organize and attend community meetings',
          'Develop and run school liaison programs',
          'Assist in local dispute resolution',
          'Conduct crime prevention awareness campaigns',
          'Gather community intelligence',
        ],
        qualifications: [
          'Completed Police Academy training',
          'Excellent interpersonal and communication skills',
          'Demonstrated understanding of local customs and community dynamics',
          'Ability to work independently and as part of a team',
        ],
        preferredQualifications: [
          'Diploma in Social Work or Community Development',
          'Fluency in additional local languages',
        ],
        employmentType: EmploymentTypeVacancy.fullTime,
        numberOfOpenings: 3,
        postingDate: DateTime.now().subtract(const Duration(days: 2)),
        closingDate: DateTime.now().add(const Duration(days: 15)),
        positionGrade: 'CST-I',
        applicationProcedure:
            'Submit application form, educational certificates, and Kebele ID to the Gondar Zonal Police HR office. Ref: VAC003.',
        keywords: [
          'community policing',
          'constable',
          'liaison',
          'outreach',
          'public safety',
        ],
      ),
      VacancyModel(
        id: 'VAC006',
        positionTitle: 'Police Academy Instructor (Law & Ethics)',
        department: 'Training and Development Wing',
        location: 'Amhara Police Training Academy, Debre Markos',
        description:
            'Develop and deliver comprehensive training modules on criminal law, procedural law, ethics, and human rights to police recruits and serving officers.',
        responsibilities: [
          'Design and update curriculum content',
          'Conduct engaging classroom instruction and practical scenarios',
          'Assess trainee performance and provide feedback',
          'Contribute to the development of training materials',
        ],
        qualifications: [
          'LLB or LLM degree',
          'Minimum 5 years of legal practice or experience in law enforcement training',
          'Strong presentation and teaching skills',
        ],
        preferredQualifications: [
          'Experience as a prosecutor or judge',
          'Advanced certifications in adult education',
        ],
        employmentType: EmploymentTypeVacancy.fullTime,
        numberOfOpenings: 2,
        postingDate: DateTime.now().subtract(const Duration(days: 60)),
        closingDate: DateTime.now().subtract(const Duration(days: 5)),
        status: VacancyStatus.closed,
        positionGrade: 'INST-SNR',
        applicationProcedure: 'Applications for this post are now closed.',
        keywords: [
          'instructor',
          'trainer',
          'law',
          'ethics',
          'academy',
          'legal',
          'police training',
        ],
      ),
    ];
  }
}
