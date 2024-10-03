import 'package:adaptive_ui/src/data/data.dart';
import 'package:adaptive_ui/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<Cryptos>.value(
          value: Cryptos(cryptoRepository: HttpCryptoRepository()),
        ),
        ChangeNotifierProvider<ApplicationPreferences>.value(
          value: ApplicationPreferences(preferences: sharedPreferences),
        ),
      ],
      child: const CryptoPricesApp(),
    ),
  );
}

class CryptoPricesApp extends StatelessWidget {
  const CryptoPricesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationPreferences>(
      builder: (context, prefs, child) => MaterialApp.router(
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.instance.router,
        theme: ThemeData.light(),
        themeMode: prefs.darkMode ? ThemeMode.dark : ThemeMode.light,
        title: 'Crypto Prices',
      ),
    );
  }
}
