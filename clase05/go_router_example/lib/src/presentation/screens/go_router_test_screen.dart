import 'package:flutter/material.dart';

class GoRouterTestScreen extends StatelessWidget {
  const GoRouterTestScreen({
    super.key,
    this.pathParameters,
    this.queryParameters,
  });

  final Map<String, String>? pathParameters;
  final Map<String, String>? queryParameters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('GoRouter Test')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Path Parameters:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            if (pathParameters?.isNotEmpty == true)
              ...pathParameters!.entries
                  .map((entry) => _buildParameterEntry(context, entry: entry)),
            const SizedBox(height: 16.0),
            Text(
              'Query Parameters:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            if (queryParameters?.isNotEmpty == true)
              ...queryParameters!.entries
                  .map((entry) => _buildParameterEntry(context, entry: entry)),
          ],
        ),
      ),
    );
  }

  Widget _buildParameterEntry(
    BuildContext context, {
    required MapEntry<String, String> entry,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          text: '${entry.key}: ',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w900),
          children: [
            TextSpan(
              text: entry.value,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
