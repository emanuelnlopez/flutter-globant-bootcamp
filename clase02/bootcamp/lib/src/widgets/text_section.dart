import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  TextSection({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          description,
          softWrap: true,
        ),
      );
}
