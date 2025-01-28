//main.dart (homepage)
import 'package:flutter/material.dart';
import 'package:myapp/screens/log.dart';
import 'package:myapp/screens/onboarding.dart';
import 'package:myapp/screens/paymentpage.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/screens/create_committee.dart';
import 'package:myapp/screens/committee_model.dart';
import 'package:myapp/screens/profile.dart';
// import 'committee.dart';  // Import the committee model

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
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/create_committee': (context) => const CreateCommitteePage(),
        '/profile': (context) => const ProfilePage(),
        '/payment': (context) => PaymentPage(
              committees: [
                Committee(
                  name: "Committee A",
                  description: "Monthly Savings Plan",
                  contributionAmount: 5000.0,
                  paymentCycle: "Monthly",
                  isActive: true,
                ),
                Committee(
                  name: "Committee B",
                  description: "Yearly Investment Plan",
                  contributionAmount: 12000.0,
                  paymentCycle: "Yearly",
                  isActive: true,
                ),
              ],
            ),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Committee> committees = [
    // Committee(
    //   name: 'Committee 1',
    //   description: 'Next payment: 1st Dec',
    //   paymentCycle: 'Monthly',
    //   contributionAmount: 12000,
    // ),
    // Committee(
    //   name: 'Committee 2',
    //   description: 'Next payment: 5th Dec',
    //   paymentCycle: 'Weekly',
    //   contributionAmount: 5000,
    // ),
    // Initial committees list
  ];

  // Handle the creation of a new committee
  void _addNewCommittee(Committee newCommittee) {
    setState(() {
      committees.add(newCommittee);
    });
  }

  // Calculate the total amount of all committees
  double _getTotalAmount() {
    double totalAmount = 0.0;
    for (var committee in committees) {
      totalAmount += committee.contributionAmount;
    }
    return totalAmount;
  }

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
            // Display total pool amount
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
                          'PKR ${_getTotalAmount().toStringAsFixed(2)}', // Display total amount
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.attach_money,
                        size: 50, color: Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Upcoming Payments Section
            Card(
              elevation: 4,
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.alarm, color: Colors.blue, size: 40),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming Payments',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Next payment due: 1st Dec',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // View Committees List
            Text(
              'Your Committees',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: committees.length,
                itemBuilder: (context, index) {
                  final committee = committees[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(committee.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(committee.description),
                          Text('Payment Cycle: ${committee.paymentCycle}',
                              style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 5),
                          Text(
                              'Contribution: PKR ${committee.contributionAmount}',
                              style: const TextStyle(color: Colors.orange)),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.orange),
                        onPressed: () {
                          // Navigate to the Committee details page
                        },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Create New Committee'),
              onPressed: () async {
                // Navigate to create committee page and wait for the result
                final newCommittee = await Navigator.push<Committee>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateCommitteePage(),
                  ),
                );

                if (newCommittee != null) {
                  _addNewCommittee(
                      newCommittee); // Add the new committee to the list
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.notification_add),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/payment');
          }
          if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
