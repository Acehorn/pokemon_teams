import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          
          ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                  value: Provider.of<ThemeService>(context).isDarkModeOn,
                  onChanged: (_) {
                    Provider.of<ThemeService>(context, listen: false)
                        .toggleTheme();
                  })),
                  const Divider(color: Colors.black,)
        ],
        
      ),
    );
  }
}
