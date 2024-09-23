import 'package:flutter/material.dart';
import 'package:named_routes/src/presentation/presentation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        Provider<MatchController>.value(value: MatchController()),
        ChangeNotifierProvider<UserController>.value(
          value: UserController(
            preferences: sharedPreferences,
          ),
        ),
      ],
      child: const SoccerScoresApp(),
    ),
  );
}

class SoccerScoresApp extends StatelessWidget {
  const SoccerScoresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soccer Scores App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const MatchListScreen(),
        '/details': (context) => const MatchDetailsScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
