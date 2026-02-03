import 'package:eduai_frontend/core/widgets/shadder_mask.dart';
import 'package:flutter/material.dart';
import 'package:eduai_frontend/core/widgets/dashboard_button.dart';
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShadderMask2(
                      widget: Icon(
                        Icons.school_outlined,
                        size: 60,
                        color: Colors.white,
                      ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShadderMask2(
                          widget: const Text(
                            'EduAI',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                      ),

                       ShadderMask2(
                         widget: Text(
                         'Your AI Study Partner',
                         style: TextStyle(
                           fontSize: 14,
                           color: Colors.white,
                         ),
                       ),
                       ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40,),

              ShadderMask1(
                  widget: Text(
                    'Welcome back!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
              ),

              ShadderMask1(
                  widget: Text(
                    'How can i help you study today ?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
              ),

              SizedBox(height: 40,),

              DashboardCard(
                title: 'Upload PDF',
                subtitle: 'Upload your study material to build your knowledge base',
                icon: Icons.upload_file,
                onTap: () {
                  // Will wire later
                  Navigator.pushNamed(context, '/uploadPDF');
                },
              ),

              const SizedBox(height: 16),
              DashboardCard(
                title: 'Generate Notes',
                subtitle: 'AI-powered notes on any topic from your documents',
                icon: Icons.description,
                onTap: () {
                  Navigator.pushNamed(context, '/generateNotes');
                },
              ),
              const SizedBox(height: 16),
              DashboardCard(
                title: 'Chat with EduAI',
                subtitle: 'Ask questions & get instant answers from your material ',
                icon: Icons.chat_bubble_outline,
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}