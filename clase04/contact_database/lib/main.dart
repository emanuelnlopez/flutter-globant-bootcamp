import 'package:contact_database/src/data/data.dart';
import 'package:contact_database/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await SqfliteContactRepository.createInstance();

  runApp(
    Provider(
      create: (context) => ContactController(contactRepository: db),
      // create: (context) => ContactController(
      //   contactRepository: InMemoryContactRepository(),
      // ),
      child: const ContactsApp(),
    ),
  );
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}
