import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_login/login_screen.dart';

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
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 707,
          width: 600,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent.shade400, Colors.blue.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(120.0),
            child: const FlutterLogo()
                .animate()
                .scale(duration: Duration(seconds: 3), curve: Curves.bounceIn),
          ),
        ),
      ),
    );
  }
}
