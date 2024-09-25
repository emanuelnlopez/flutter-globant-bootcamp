import 'package:contact_list_firestore/src/data/data.dart';
import 'package:contact_list_firestore/src/presentation/presentation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDdMVGGC6tA0Fgbvwg63k8o8lP_AfpUcEE',
      appId: '1:878878886989:android:ccb43bfe8b8d296df56004',
      messagingSenderId: '878878886989',
      projectId: 'globant-flutter-contact-list',
    ),
  );

  runApp(
    Provider(
      create: (context) => ContactController(
        contactRepository: FirestoreContactRepository(),
      ),
      child: const ContactsApp(),
    ),
  );
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Contact List App',
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}
