class Notification {
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  Notification({
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false, // default value for isRead
  });

  // Factory method to create a Notification from JSON
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false, // provide a default value
    );
  }
}
