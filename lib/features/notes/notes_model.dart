class NotesResult {
  final String topic;
  final String notes;

  NotesResult({
    required this.topic,
    required this.notes,
  });

  factory NotesResult.fromJson(Map<String, dynamic> json) {
    return NotesResult(
      topic: json['topic'],
      notes: json['notes'],
    );
  }
}
