import 'package:flutter/material.dart';
import 'package:pokemon_teams/theme.dart';
import 'package:provider/provider.dart';
import 'application/core/theme_service.dart';
import 'application/pages/home/home_page.dart';

void main() {
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
        home: const HomePageWrapperProvider(),
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      );
    });
  }
}
