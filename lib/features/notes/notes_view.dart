import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/widgets/shadder_mask.dart';
import 'notes_view_model.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesViewModel(),
      child: const _NotesScreen(),
    );
  }
}

class _NotesScreen extends StatelessWidget {
  const _NotesScreen();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NotesViewModel>();
    final TextEditingController topicController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: ShadderMask2(
          widget: const Text(
            "Generate Notes",
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🔹 INPUT CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Topic",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: topicController,
                      decoration: InputDecoration(
                        hintText: "e.g. DBMS Architecture",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.auto_awesome),
                        label: const Text(
                          "Generate Notes",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: vm.isLoading
                            ? null
                            : () => vm.generateNotes(topicController.text),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 16),
        
              // 🔹 LOADING
              if (vm.isLoading)
                Column(
                  children: const [
                    SizedBox(height: 16),
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text(
                      "Generating notes using AI...",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
        
              // 🔹 ERROR
              if (vm.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    vm.errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        
              // 🔹 NOTES CONTAINER
              if (vm.result != null)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 HEADER + ACTIONS
                        Row(
                          children: [
                            const Icon(Icons.notes, size: 22),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                vm.result!.topic,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
        
                            // 📋 COPY
                            IconButton(
                              icon: const Icon(Icons.copy),
                              tooltip: "Copy notes",
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: vm.result!.notes),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Notes copied to clipboard"),
                                  ),
                                );
                              },
                            ),
        
                            // 📤 SHARE
                            IconButton(
                              icon: const Icon(Icons.share),
                              tooltip: "Share notes",
                              onPressed: () async{
                                await SharePlus.instance.share(
                                  ShareParams(
                                    text: "📘 ${vm.result!.topic}\n\n${vm.result!.notes}",
                                    subject: vm.result!.topic,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
        
                        // 🔹 SCROLLABLE NOTES TEXT
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              vm.result!.notes,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
