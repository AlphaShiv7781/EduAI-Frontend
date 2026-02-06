import 'package:flutter/material.dart';
import 'chat_api_response.dart';
import 'chat_message_model.dart';
// later: import http client

class ChatViewModel extends ChangeNotifier {
  final List<ChatMessage> messages = [];
  bool isTyping = false;

  String sessionId = "user1"; // initial session

  ChatViewModel() {
    _addGreeting();
  }

  void _addGreeting() {
    messages.add(
      ChatMessage(
        message:
        "👋 Hi! I’m EduAI.\n\nAsk me questions based on your uploaded study material.",
        isUser: false,
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // 1️⃣ Add user message
    messages.add(ChatMessage(
      message: text,
      isUser: true,
    ));
    notifyListeners();

    // 2️⃣ Typing indicator
    isTyping = true;
    notifyListeners();

    // 3️⃣ CALL BACKEND (mocked here)
    await Future.delayed(const Duration(seconds: 2));

    // 🔹 MOCK BACKEND RESPONSE (replace with real API)
    final responseJson = {
      "session_id": sessionId,
      "question": text,
      "answer":
      "I could not find this information in the provided documents.",
      "chunks_used": 5,
    };

    final apiResponse = ChatApiResponse.fromJson(responseJson);

    // 4️⃣ Update session id (important for memory)
    sessionId = apiResponse.sessionId;

    // 5️⃣ Convert backend answer to user-friendly AI message
    final aiMessage = _formatAnswer(apiResponse);

    messages.add(ChatMessage(
      message: aiMessage,
      isUser: false,
    ));

    isTyping = false;
    notifyListeners();
  }

  String _formatAnswer(ChatApiResponse response) {
    if (response.answer
        .toLowerCase()
        .contains("could not find")) {
      return
        "📄 I couldn’t find this topic in your uploaded documents.\n\n"
            "However, I can still explain it in general. Would you like that?";
    }

    return response.answer;
  }
}
