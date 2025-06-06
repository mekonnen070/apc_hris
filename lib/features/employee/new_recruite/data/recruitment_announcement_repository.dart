import 'package:police_com/core/enums/announcement_status.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruitment_announcement.dart';

/// Abstract repository for fetching RecruitmentAnnouncements.
abstract class RecruitmentAnnouncementRepository {
  Future<List<RecruitmentAnnouncement>> fetchAll();
}

/// Mock implementation for development/testing.
class MockRecruitmentAnnouncementRepository
    implements RecruitmentAnnouncementRepository {
  @override
  Future<List<RecruitmentAnnouncement>> fetchAll() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      RecruitmentAnnouncement(
        announcementId: '1',
        announcementTitle: 'Police Cadet Intake 2025',
        announcementDescription:
            'Join the national police force. Open to all graduates.',
        requiredApplicants: 200,
        round: '1',
        createdDate: DateTime(2025, 5),
        createdBy: 'admin',
        expiryDate: DateTime(2025, 6, 30),
        status: AnnouncementStatus.created,
        postedDate: DateTime(2025, 5, 5),
        postedBy: 'admin',
      ),
      RecruitmentAnnouncement(
        announcementId: '2',
        announcementTitle: 'Special Forces Recruitment',
        announcementDescription: 'Elite unit recruitment, strict requirements.',
        requiredApplicants: 50,
        round: '2',
        createdDate: DateTime(2025, 6),
        createdBy: 'recruiter',
        expiryDate: DateTime(2025, 7, 15),
        status: AnnouncementStatus.posted,
        postedDate: DateTime(2025, 6, 2),
        postedBy: 'recruiter',
      ),
    ];
  }
}
