import 'package:firestore_polls/src/domain/domain.dart';
import 'package:firestore_polls/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PollVoteScreen extends StatefulWidget {
  const PollVoteScreen({
    super.key,
    required this.pollId,
  });

  final String pollId;

  @override
  State<PollVoteScreen> createState() => _PollVoteScreenState();
}

class _PollVoteScreenState extends State<PollVoteScreen> {
  late final PollController _pollController;

  Poll? _poll;
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _pollController = context.read<PollController>();
    _pollController.pollStream
        .where((poll) => poll.id == widget.pollId)
        .listen((poll) => setState(() {
              _poll = poll;
              _selectedOption = null;
            }));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pollController.firePoll(widget.pollId);
    });
  }

  Future<void> _delete() async {
    await _pollController.delete(widget.pollId);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _vote() async {
    if (_selectedOption != null) {
      final updatedVotes = Map<String, int>.from(_poll!.votes);
      updatedVotes[_selectedOption!] =
          (updatedVotes[_selectedOption!] ?? 0) + 1;

      await _pollController.vote(_poll!.copyWith(votes: updatedVotes));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vote recorded!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an option first!!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vote')),
      body: _poll == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _poll!.question,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ..._poll!.options.map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (value) => setState(
                        () => _selectedOption = value,
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.delete),
                            onPressed: _delete,
                            label: const Text('DELETE'),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.check),
                            onPressed: _vote,
                            label: const Text('VOTE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PollResults(poll: _poll!),
                ],
              ),
            ),
    );
  }
}
