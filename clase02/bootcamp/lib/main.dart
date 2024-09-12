import 'package:bootcamp/src/my_app.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

/// Punto de entrada de la aplicación.
void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });

  /// runApp() ejecuta la aplicación,
  /// tomando MyApp como widget raíz
  /// y colocándolo en la pantalla.
  runApp(MyApp());
}
