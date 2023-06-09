import 'package:flutter/material.dart';
import 'package:pokemon_teams/application/core/theme_service.dart';
import 'package:pokemon_teams/application/pages/home/home_page.dart';
import 'package:pokemon_teams/application/pages/settings_page/settings_page.dart';
import 'package:pokemon_teams/theme.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const HomePageWrapperProvider(),
          '/settings': (context) => const SettingsPage(),
        },
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      );
    });
  }
}
