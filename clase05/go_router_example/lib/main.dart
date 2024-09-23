import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/src/presentation/presentation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
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
      child: SoccerScoresApp(),
    ),
  );
}

class SoccerScoresApp extends StatelessWidget {
  SoccerScoresApp({super.key});

  final routes = GoRouter(
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const MatchListScreen(),
      ),
      GoRoute(
        name: 'details',
        path: '/match/:id',
        builder: (context, state) => MatchDetailsScreen(
          id: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        name: 'profile',
        path: '/profile',
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        name: 'test',
        path: '/test/:id/date/:date',
        builder: (context, state) => GoRouterTestScreen(
          pathParameters: state.pathParameters,
          queryParameters: state.uri.queryParameters,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Soccer Scores App',
      routerConfig: routes,
    );
  }
}
