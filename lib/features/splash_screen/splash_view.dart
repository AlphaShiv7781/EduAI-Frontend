import 'dart:async';
import 'package:eduai_frontend/core/constants/gradient.dart';
import 'package:flutter/material.dart';
import '../dashboard/dashboard_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/dashboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradient2

          ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(Icons.school_outlined, size: 150, color: Colors.white,),
              SizedBox(height: 16,),
              Text(
                'EduAI',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                'Your AI Study Partner',
                style: TextStyle(
                  color: Colors.white
                ),
              )
          ],
                ),
        ),
    );
  }
}
