//create_committe.dart

import 'package:flutter/material.dart';
import 'package:myapp/screens/committee_model.dart';

class CreateCommitteePage extends StatefulWidget {
  const CreateCommitteePage({super.key});

  @override
  _CreateCommitteePageState createState() => _CreateCommitteePageState();
}

class _CreateCommitteePageState extends State<CreateCommitteePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _committeeNameController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contributionController = TextEditingController();
  String _selectedPaymentCycle = 'Weekly';

  final List<String> _paymentCycles = ['Weekly', 'Bi-weekly', 'Monthly'];

  @override
  void dispose() {
    _committeeNameController.dispose();
    _descriptionController.dispose();
    _contributionController.dispose();
    super.dispose();
  }

  void _createCommittee() {
    if (_formKey.currentState!.validate()) {
      final newCommittee = Committee(
        name: _committeeNameController.text,
        description: _descriptionController.text,
        paymentCycle: _selectedPaymentCycle,
        contributionAmount: double.parse(_contributionController.text),
      );
      Navigator.pop(
          context, newCommittee); // Pass the new committee back to HomePage
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
              TextFormField(
                controller: _committeeNameController,
                decoration: const InputDecoration(
                  labelText: 'Committee Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a committee name'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a description'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contributionController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Contribution Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contribution amount';
                  }
                  final number = double.tryParse(value);
                  if (number == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedPaymentCycle,
                decoration: const InputDecoration(
                  labelText: 'Payment Cycle',
                  border: OutlineInputBorder(),
                ),
                items: _paymentCycles.map((cycle) {
                  return DropdownMenuItem(
                    value: cycle,
                    child: Text(cycle),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentCycle = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createCommittee,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Create Committee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
