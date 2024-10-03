import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._() {
    router = GoRouter(
      initialLocation: NamedRoutes.home.path,
      routes: _getRoutes(),
    );
  }

  static get instance => AppRouter._();
  late final GoRouter router;

  List<RouteBase> _getRoutes() => [
        GoRoute(
          name: NamedRoutes.home.name,
          path: NamedRoutes.home.path,
          builder: (context, state) => const CryptoListScreen(),
        ),
        GoRoute(
          name: NamedRoutes.details.name,
          path: NamedRoutes.details.path,
          builder: (context, state) => CryptoDetailsScreen(
            id: state.pathParameters[PathParameters.id],
          ),
        ),
        GoRoute(
          name: NamedRoutes.settings.name,
          path: NamedRoutes.settings.path,
          builder: (context, state) => const SettingsScreen(),
        ),
      ];
}
