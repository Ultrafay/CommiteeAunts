// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:myapp/screens/committee/committee_model.dart';
import 'package:myapp/screens/committee/create_committee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Committee> committees = [];

  void _addNewCommittee(Committee newCommittee) {
    setState(() {
      committees.add(newCommittee);
    });
  }

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
            // ... (rest of your HomePage UI code - cards, committee list, etc.)
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
                          'PKR ${_getTotalAmount().toStringAsFixed(2)}',
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
                          'Next payment due: 1st Dec', // Example date
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
                          // Navigate to committee details page - if you create one
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Create New Committee'),
              onPressed: () async {
                final newCommittee = await Navigator.push<Committee>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateCommitteePage(),
                  ),
                );

                if (newCommittee != null) {
                  _addNewCommittee(newCommittee);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}