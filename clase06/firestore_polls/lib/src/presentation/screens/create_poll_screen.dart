import 'package:firestore_polls/src/domain/domain.dart';
import 'package:firestore_polls/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _optionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  Future<void> _createPoll() async {
    if (_formKey.currentState!.validate()) {
      final poll = Poll(
        question: _questionController.text,
        options:
            _optionControllers.map((controller) => controller.text).toList(),
        votes: {for (var controller in _optionControllers) controller.text: 0},
      );

      await context.read<PollController>().create(poll);
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Poll')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a question';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ..._optionControllers.asMap().entries.map((entry) {
              int idx = entry.key;
              var controller = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Option ${idx + 1}',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an option';
                    }
                    return null;
                  },
                ),
              );
            }),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addOption,
              child: const Text('Add Option'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _createPoll,
              child: const Text('Create Poll'),
            ),
          ],
        ),
      ),
    );
  }
}
