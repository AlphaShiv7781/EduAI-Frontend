import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'ingest_model.dart';

class IngestViewModel extends ChangeNotifier {
  File? selectedFile;
  bool isUploading = false;
  String? errorMessage;
  IngestResult? result;

   Future<void> pickPdf () async{

    errorMessage = null;
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.single.path != null) {
        selectedFile = File(result.files.single.path!);
        notifyListeners();
      }
    } catch (e) {
      errorMessage = "Failed to pick PDF file";
    }

  }

  Future<void> uploadPdf() async {
    if (selectedFile == null) {
      errorMessage = "Please select a PDF file";
      notifyListeners();
      return;
    }

    isUploading = true;
    errorMessage = null;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock success
    result = result = IngestResult(
      status: "success",
      chunksStored: 26,
      embeddingType: "local",
    );
    isUploading = false;
    notifyListeners();
  }
}
