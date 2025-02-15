import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(
      {super.key, required this.getNextRoute}); // Added getNextRoute parameter

  final String Function() getNextRoute; // Define the callback function type

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Call the navigation function
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Delay for splash screen
    String nextRoute =
        widget.getNextRoute(); // Get the next route using the callback
    Navigator.pushReplacementNamed(
        context, nextRoute); // Navigate to the determined route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D1D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // const Text(
            //   '',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     color: Colors
            //         .white, // Added white color for text to be visible on dark background
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
