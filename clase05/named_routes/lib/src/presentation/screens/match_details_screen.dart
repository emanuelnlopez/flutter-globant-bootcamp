import 'dart:async';

import 'package:flutter/material.dart';
import 'package:named_routes/src/domain/domain.dart';
import 'package:named_routes/src/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({super.key});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  SoccerMatch? _match;
  final _subscriptions = <StreamSubscription>[];

  void _cancelSubscriptions() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }

    _subscriptions.clear();
  }

  @override
  void dispose() {
    _cancelSubscriptions();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cancelSubscriptions();

    final controller = context.read<MatchController>();
    _subscriptions.add(controller.matchStream.listen((match) {
      setState(() => _match = match);
    }));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      controller.getMatch(args['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Match Details')),
      body: _match == null
          ? const Center(child: CircularProgressIndicator())
          : MatchListItem(match: _match!),
    );
  }
}
