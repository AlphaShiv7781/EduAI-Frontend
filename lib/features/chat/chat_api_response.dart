class ChatApiResponse {
  final String sessionId;
  final String question;
  final String answer;
  final int chunksUsed;

  ChatApiResponse({
    required this.sessionId,
    required this.question,
    required this.answer,
    required this.chunksUsed,
  });

  factory ChatApiResponse.fromJson(Map<String, dynamic> json) {
    return ChatApiResponse(
      sessionId: json['session_id'],
      question: json['question'],
      answer: json['answer'],
      chunksUsed: json['chunks_used'],
    );
  }
}
