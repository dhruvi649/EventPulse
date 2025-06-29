class EventModel {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final String date;

  EventModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.date,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      date: json['date'],
    );
  }
}
