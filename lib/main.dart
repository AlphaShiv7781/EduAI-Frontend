import 'package:eduai_frontend/features/chat/chat_view.dart';
import 'package:eduai_frontend/features/dashboard/dashboard_view.dart';
import 'package:eduai_frontend/features/ingest/ingest_view.dart';
import 'package:eduai_frontend/features/notes/notes_view.dart';
import 'package:eduai_frontend/features/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal[100], // 🌤️ global background
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6F7CFF),
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=>SplashScreen(),
        '/dashboard':(context)=>DashboardView(),
        '/uploadPDF':(context)=>IngestView(),
        '/generateNotes':(context)=>NotesView(),
        '/chat': (context)=> ChatView()
      },
    );
  }
}

