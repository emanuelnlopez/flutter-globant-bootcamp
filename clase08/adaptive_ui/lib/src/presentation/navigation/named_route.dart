abstract class NamedRoutes {
  static final home = NamedRoute(
    name: 'home',
    path: '/home',
  );
  static final details = NamedRoute(
    name: 'details',
    path: '/details/:${PathParameters.id}',
  );
  static final settings = NamedRoute(
    name: 'settings',
    path: '/settings',
  );

  static List<NamedRoute> get routes => [home, settings];
}

class NamedRoute {
  NamedRoute({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}

abstract class PathParameters {
  static const id = 'id';
}
