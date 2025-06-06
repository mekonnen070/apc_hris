/// Represents the status of an announcement in the system.
///
enum AnnouncementStatus {
  /// The announcement has been created but not yet posted.
  created,

  /// The announcement has been posted and is visible to users.
  posted,

  /// The announcement has expired and is no longer active.
  expired,
}
