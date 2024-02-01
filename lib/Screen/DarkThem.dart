import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ThemeChangerProvider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dark Theme"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: const Text("Dark Theme"),
              value: true,
              groupValue: themeProvider.isDark,
              onChanged: (value) {
                themeProvider.changeTheme(value!);
              },
            ),
            RadioListTile(
              title: const Text("Light Theme"),
              value: false, // Assuming false is for the light theme
              groupValue: themeProvider.isDark,
              onChanged: (value) {
                themeProvider.changeTheme(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
