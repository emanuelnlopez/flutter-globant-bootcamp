import 'dart:math';

import 'package:contact_database/src/domain/domain.dart';
import 'package:contact_database/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    required this.contact,
    super.key,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: _ContactAvatar(
          initials: contact.initials,
        ),
        title: Text(
          contact.fullName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactFormScreen(contact: contact),
          ),
        ),
      );
}

class _ContactAvatar extends StatelessWidget {
  const _ContactAvatar({required this.initials});

  final String initials;

  MaterialColor _getRandomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    final color = _getRandomColor();
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        initials,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color[100],
            ),
      ),
    );
  }
}
