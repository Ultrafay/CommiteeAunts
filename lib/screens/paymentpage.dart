import 'package:flutter/material.dart';
import 'package:myapp/screens/committee_model.dart';
import 'paymentformpage.dart';

class PaymentPage extends StatelessWidget {
  final List<Committee> committees;
  final double fixedMonthlyPay;

  const PaymentPage(
      {super.key, required this.committees, this.fixedMonthlyPay = 10000.0});

  @override
  Widget build(BuildContext context) {
    // Filter active committees
    List<Committee> activeCommittees =
        committees.where((committee) => committee.isActive).toList();

    // Calculate total payment based on active committees
    double totalPayment = activeCommittees.fold(
        0.0, (sum, committee) => sum + committee.contributionAmount);

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
            // Total Payment to be made
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
                          'Total Payment Due',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'PKR ${totalPayment.toStringAsFixed(2)}', // Display total amount
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
            // List Active Committees and Payment Details
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
                                    style:
                                        const TextStyle(color: Colors.orange)),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward,
                                  color: Colors.orange),
                              onPressed: () {
                                // Navigate to Payment Details page for each committee
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Pay Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              icon: const Icon(Icons.payment),
              label: const Text('Pay Now'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentFormPage(totalPayment: totalPayment),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
