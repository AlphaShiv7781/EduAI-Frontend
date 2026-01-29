import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('ingest pdf'),
              Text('generate notes'),
              Text('Chat with EduAI'),
            ],
          ),
        ),
    );
  }
}
