//main.dart (application entry point)
import 'package:flutter/material.dart';
import 'package:myapp/screens/auth/log.dart';
import 'package:myapp/screens/Onboarding/onboarding.dart';
import 'package:myapp/screens/auth/signup.dart';
import 'package:myapp/screens/Onboarding/splash_screen.dart';
import 'package:myapp/screens/committee/create_committee.dart';
import 'package:myapp/navbardot/main_wrapper.dart';
import 'package:myapp/screens/homescreen/home_screen.dart'; // Import HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isOnboardingComplete = false; // Flag to track onboarding status

  // In a real app, you would load this from SharedPreferences in initState()
  // Example (you'll need to add shared_preferences dependency):
  // @override
  // void initState() {
  //   super.initState();
  //   _checkOnboardingStatus();
  // }
  //
  // _checkOnboardingStatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _isOnboardingComplete = prefs.getBool('onboarding_complete') ?? false;
  //   });
  // }
  //
  // // Function to set onboarding status after onboarding is done
  // _setOnboardingComplete() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('onboarding_complete', true);
  //   setState(() {
  //     _isOnboardingComplete = true;
  //   });
  // }

  // For this example, we'll use a simple method to simulate onboarding completion
  void _setOnboardingComplete() {
    setState(() {
      _isOnboardingComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Committee Buddy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash', // Start with splash screen
      routes: {
        '/splash': (context) => SplashScreen(
              getNextRoute: () => _isOnboardingComplete
                  ? '/login'
                  : '/onboarding', // Determine next route after splash
            ),
        '/onboarding': (context) => OnboardingScreen(
              onOnboardingComplete: _setOnboardingComplete,
            ),
        '/login': (context) => const LoginPage(),
        '/home': (context) => MainWrapper(
              // Point '/home' route to MainWrapper
              isOnboardingComplete: _isOnboardingComplete,
            ),
        '/signup': (context) => const SignUpPage(),
        '/create_committee': (context) => const CreateCommitteePage(),
        '/home_screen': (context) =>
            const HomeScreen(), // NEW ROUTE for HomeScreen
      },
    );
  }
}
