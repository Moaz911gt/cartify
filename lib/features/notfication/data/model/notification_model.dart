class NotificationModel {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      date: jsonData['date'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description, 'date': date};
  }

  static int generateNotificationId() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }
}
