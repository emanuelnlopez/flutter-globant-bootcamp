import 'package:flutter/material.dart';
import 'package:named_routes/src/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MatchController>().getMatches();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          )
        ],
        title: const Text('Scores'),
      ),
      body: StreamBuilder(
        stream: context.read<MatchController>().matchesStream,
        builder: (context, snapshot) {
          Widget result;
          if (!snapshot.hasData) {
            result = const Center(child: CircularProgressIndicator());
          } else {
            final matches = snapshot.data;
            result = ListView.separated(
              itemCount: matches!.length,
              itemBuilder: (context, index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: {'id': index},
                    ),
                    child: MatchListItem(match: matches[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
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
    );
  }
}
