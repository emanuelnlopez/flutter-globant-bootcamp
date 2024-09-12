import 'package:bootcamp/src/index_screen.dart';
import 'package:flutter/material.dart';

/// MyApp es un widget de tipo StatelessWidget,
/// lo que significa que su estado no cambia durante su ciclo de vida.
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// `MaterialApp` configura el comportamiento y la apariencia general de la aplicación.
    /// `title`: El título de la aplicación.
    /// `theme`: Define el tema de colores de la aplicación.
    /// `home`: El widget principal que se muestra en la pantalla.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// ...
        ///
        /// Notice that the counter didn't reset back to zero; the application
        /// state is not lost during the reload. To reset the state, use hot
        /// restart instead.
        ///
        /// This works for code too, not just values: Most code changes can be
        /// tested with just a hot reload.
        ///
        /// ...
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IndexScreen(),
    );
  }
}
