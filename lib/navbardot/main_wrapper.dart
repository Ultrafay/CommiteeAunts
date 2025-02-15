// navbardot/main_wrapper.dart

import 'package:flutter/material.dart';
import 'package:myapp/screens/payment/paymentpage.dart';
import 'package:myapp/screens/Setting/profile.dart';
import 'package:myapp/screens/homescreen/home_screen.dart'; // Import HomeScreen
// import 'package:myapp/screens/notification/notification.dart';// Import NotificationsPage

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.isOnboardingComplete});

  final bool isOnboardingComplete; // Flag to control navbar visibility

  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  // Use HomeScreen here instead of MyApp() - which was incorrect
  final List<Widget> _screens = [
    const HomeScreen(),
    const PaymentPage(
      committees: [],
    ),
    const Center(
        child: Text(
            'Notifications Placeholder')), // Replace Placeholder() with NotificationsPage()
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar:
          widget.isOnboardingComplete // Conditionally show navbar
              ? BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.orange,
                  onTap: _onItemTapped,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.payments),
                      label: 'Payments',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notification_add),
                      label: 'Notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: 'Profile',
                    ),
                  ],
                )
              : null, // Navbar is null (hidden) if onboarding is not complete
    );
  }
}
