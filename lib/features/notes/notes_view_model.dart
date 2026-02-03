import 'package:flutter/material.dart';
import 'notes_model.dart';

class NotesViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  NotesResult? result;

  Future<void> generateNotes(String topic) async {
    // 1️⃣ Validate input
    if (topic.trim().isEmpty) {
      errorMessage = "Please enter a topic";
      notifyListeners();
      return;
    }

    // 2️⃣ Start loading
    isLoading = true;
    errorMessage = null;
    result = null;
    notifyListeners();

    // 3️⃣ Simulate backend call (mock)
    await Future.delayed(const Duration(seconds: 2));

    // 4️⃣ Mock backend response
    result = NotesResult(
      topic: topic,
      notes:
      "These are AI-generated notes for $topic.\n\n"
          "• Definition\n"
          "• Key components\n"
          "• Architecture explanation\n"
          "• Exam-oriented points",
    );

    // 5️⃣ Stop loading
    isLoading = false;
    notifyListeners();
  }
}
