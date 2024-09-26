import 'dart:async';

import 'package:firestore_polls/src/domain/domain.dart';
import 'package:firestore_polls/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PollListScreen extends StatefulWidget {
  const PollListScreen({super.key});

  @override
  State<PollListScreen> createState() => _PollListScreenState();
}

class _PollListScreenState extends State<PollListScreen> {
  late final PollController _pollController;
  final _subscriptions = <StreamSubscription>[];
  var _create = true;

  void _cancelSubscriptions() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }

    _subscriptions.clear();
  }

  @override
  void initState() {
    super.initState();
    _cancelSubscriptions();
    _subscriptions.add(
        context.read<AppSettingsController>().settingsStream.listen((settings) {
      setState(() => _create = settings.create);
    }));

    _pollController = context.read<PollController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Polls')),
      body: StreamBuilder<List<Poll>>(
        stream: _pollController.pollsStream,
        builder: (context, snapshot) {
          Widget result;
          if (snapshot.hasError) {
            result = const Center(child: Text('Something went wrong'));
          } else if (snapshot.hasData != true) {
            result = const Center(child: CircularProgressIndicator());
          } else if (snapshot.data?.isNotEmpty != true) {
            result = Center(
              child: Text(
                'No hay encuestas para mostrar',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          } else {
            final polls = snapshot.data!;
            result = ListView.separated(
              itemCount: polls.length,
              itemBuilder: (context, index) => PollListItem(poll: polls[index]),
              separatorBuilder: (_, __) => const Divider(
                endIndent: 16.0,
                height: 1.0,
                indent: 16.0,
                thickness: 1.0,
              ),
            );
          }
          return result;
        },
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: AnimatedOpacity(
            opacity: _create ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: FloatingActionButton(
              onPressed: !_create
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreatePollScreen()),
                      );
                    },
              child: const Icon(Icons.add),
            )),
      ),
    );
  }
}
