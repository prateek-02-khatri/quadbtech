import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quadb_tech/screen/navigation_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const NavigationMenu()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 110,
              'assets/icon.png',
            ),

            const SizedBox(height: 30),

            const Text(
              'Movie App',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '(Flutter Test)',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
