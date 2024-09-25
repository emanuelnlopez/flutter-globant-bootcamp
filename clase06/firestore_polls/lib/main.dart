import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_polls/src/data/repository/firestore_poll_repository.dart';
import 'package:firestore_polls/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC1T6aFnTzNiqmjPGREglZ3AmIlt3kB8TU',
      appId: '1:228740466724:android:41547da8958b7381bb30b1',
      messagingSenderId: '228740466724',
      projectId: 'flutter-firestore-polls',
    ),
  );

  runApp(
    Provider(
      create: (_) => PollController(pollRepository: FirestorePollRepository()),
      child: const FirestorePollApp(),
    ),
  );
}

class FirestorePollApp extends StatelessWidget {
  const FirestorePollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Poll App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const PollListScreen());
  }
}
