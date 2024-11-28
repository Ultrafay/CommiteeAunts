import 'package:flutter/material.dart';

class CreateCommitteePage extends StatefulWidget {
  const CreateCommitteePage({super.key});

  @override
  _CreateCommitteePageState createState() => _CreateCommitteePageState();
}

class _CreateCommitteePageState extends State<CreateCommitteePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _committeeNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contributionController = TextEditingController();
  String _selectedPaymentCycle = 'Weekly';

  // List of payment cycles (e.g., Weekly, Bi-weekly, Monthly)
  final List<String> _paymentCycles = ['Weekly', 'Bi-weekly', 'Monthly'];

  @override
  void dispose() {
    _committeeNameController.dispose();
    _descriptionController.dispose();
    _contributionController.dispose();
    super.dispose();
  }

  // Function to handle form submission
  void _createCommittee() {
    if (_formKey.currentState!.validate()) {
      // Process data here (for now, just print it)
      print('Committee Name: ${_committeeNameController.text}');
      print('Description: ${_descriptionController.text}');
      print('Contribution Amount: ${_contributionController.text}');
      print('Payment Cycle: $_selectedPaymentCycle');

      // You can add functionality to save this data to a backend or local storage

      // Show confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Committee created successfully!')),
      );

      // Optionally, navigate to another page (e.g., Dashboard)
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Committee'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Committee Name
              TextFormField(
                controller: _committeeNameController,
                decoration: const InputDecoration(
                  labelText: 'Committee Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a committee name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Contribution Amount
              TextFormField(
                controller: _contributionController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Contribution Amount (in \$)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contribution amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Payment Cycle Dropdown
              DropdownButtonFormField<String>(
                value: _selectedPaymentCycle,
                items: _paymentCycles.map((String cycle) {
                  return DropdownMenuItem<String>(
                    value: cycle,
                    child: Text(cycle),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentCycle = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Payment Cycle',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Create Button
              ElevatedButton(
                onPressed: _createCommittee,
                child: const Text(
                  'Create Committee',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
