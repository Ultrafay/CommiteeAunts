import 'package:flutter/material.dart';
import 'package:myapp/screens/committee/committee_model.dart';
import 'paymentformpage.dart';

class PaymentPage extends StatelessWidget {
  final List<Committee> committees;

  const PaymentPage({super.key, required this.committees});

  @override
  Widget build(BuildContext context) {
    List<Committee> activeCommittees =
        committees.where((committee) => committee.isActive).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Committees',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: activeCommittees.isEmpty
                  ? const Center(
                      child: Text(
                        'No active committees available.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: activeCommittees.length,
                      itemBuilder: (context, index) {
                        final committee = activeCommittees[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              committee.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(committee.description),
                                Text(
                                  'Payment Cycle: ${committee.paymentCycle}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Contribution: PKR ${committee.contributionAmount.toStringAsFixed(2)}',
                                  style: const TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                              child: const Text(
                                'Pay Now',
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentFormPage(
                                      totalPayment:
                                          committee.contributionAmount,
                                      committeeName: committee.name,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
