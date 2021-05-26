import 'package:flutter/material.dart';
import 'package:projeto_clima/screens/home.dart';
import 'package:projeto_clima/theme/theme.dart';

void main() {
  runApp(PrevisaoTempo());
}

class PrevisaoTempo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'previsão do tempo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
