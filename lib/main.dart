import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/log.dart';
import 'package:myapp/screens/onboarding.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/screens/create_committee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Committee Buddy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/create_committee': (context) =>
            const CreateCommitteePage(), // Add this route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee Buddy'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Card for Collective Money
            Card(
              elevation: 4,
              color: Colors.orange[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Pool Amount',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'PKR 120,000', // Replace with dynamic data
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.attach_money, size: 50, color: Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Current Members Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              icon: const Icon(Icons.group),
              label: const Text('View Current Members'),
              onPressed: () {
                // Navigate to Current Members Screen
              },
            ),
            const SizedBox(height: 20),

            // Committees Section
            Text(
              'Your Committees',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with dynamic list length
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(Icons.group_work, color: Colors.orange),
                      title: Text('Committee ${index + 1}'),
                      subtitle: Text('Next payment: 1st Dec'),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'pay') {
                            // Handle payment
                          } else if (value == 'details') {
                            // Navigate to details
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'pay',
                            child: Row(
                              children: const [
                                Icon(Icons.payment, color: Colors.green),
                                SizedBox(width: 10),
                                Text('Make Payment'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'details',
                            child: Row(
                              children: const [
                                Icon(Icons.info, color: Colors.blue),
                                SizedBox(width: 10),
                                Text('View Details'),
                              ],
                            ),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Create New Committee Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              icon: const Icon(Icons.add),
              label: const Text('Create New Committee'),
              onPressed: () {
                Navigator.pushNamed(context, '/create_committee');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
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
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

// void () {
//   runApp(MaterialApp(
//     theme: ThemeData(primarySwatch: Colors.orange),
//     home: HomePage(),
//   ));
// }
