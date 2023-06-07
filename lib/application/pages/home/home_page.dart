import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/widgets/app_bar.dart';
import '../settings_page/settings_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBarPokemon(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.favorite, color: themeData.primaryColorLight)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                  icon:
                      Icon(Icons.settings, color: themeData.primaryColorLight)),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(children: [
      Container(),
        ]),
      ),
    );
    
  }

}