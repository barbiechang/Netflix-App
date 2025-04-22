class TopicModel {
  final int? id;
  final String title;
  final String conversation;

  TopicModel({
    this.id,
    required this.title,
    required this.conversation,
  });

  // Convert TopicModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'conversation': conversation,
    };
  }

  // Create TopicModel from Map
  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'],
      title: map['title'],
      conversation: map['conversation'],
    );
  }
}
