import 'package:contact_list/src/controller/contact_controller.dart';
import 'package:contact_list/src/screens/contact_list_screen.dart';
import 'package:contact_list_data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await SqfliteContactRepository.createInstance();

  runApp(
    Provider(
      create: (context) => ContactController(contactRepository: db),
      child: const ContactsApp(),
    ),
  );
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modularized Contact List App',
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}
