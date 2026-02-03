import 'package:eduai_frontend/core/widgets/shadder_mask.dart';
import 'package:eduai_frontend/core/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ingest_view_model.dart';

class IngestView extends StatelessWidget {
  const IngestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IngestViewModel(),
      child: const _IngestScreen(),
    );
  }
}

class _IngestScreen extends StatelessWidget {
  const _IngestScreen();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<IngestViewModel>();

    return Scaffold(
      appBar: AppBar(
          title: ShadderMask2(
            widget: const Text(
                "Upload PDF",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30
                ),
            ),
          ),
          backgroundColor: Colors.teal[100],
        leading: IconButton(
            onPressed: (){Navigator.pop(context);}, 
            icon: ShadderMask2(
              widget: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 30,
              ),
            ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 12),
                Expanded(
                  child: ShadderMask2(
                    widget: Text(
                      "Your PDF will be securely uploaded and processed for AI analysis.",
                      style: TextStyle(fontSize: 16 , color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: vm.pickPdf,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                       ShadderMask2(widget: Icon(Icons.upload_file, size: 70,color: Colors.white,)),
                      const SizedBox(height: 15),
                      ShadderMask2(
                        widget: Text(vm.selectedFile != null
                            ? "PDF Selected"
                            : "Choose a PDF file",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                           ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      SimplElevatedButton(
                          onTap: vm.isUploading ? null : vm.uploadPdf,
                          child: vm.isUploading
                              ? const CircularProgressIndicator()
                              : const Text(
                              "Upload",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                      )
                    ],
                  ),
                ),
              ),

              if (vm.errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(vm.errorMessage!,
                    style: const TextStyle(color: Colors.red)),
              ],
              if (vm.result != null) ...[
                const SizedBox(height: 16),
                Text(
                  "PDF processed successfully\n"
                      "Chunks stored: ${vm.result!.chunksStored}\n"
                      "Embedding: ${vm.result!.embeddingType}",
                  style: const TextStyle(color: Colors.green),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
