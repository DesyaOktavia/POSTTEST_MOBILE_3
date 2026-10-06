import 'package:flutter/material.dart';
import 'pages/main_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

// Root Widget Aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Diabetes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MainNavigationPage(),
    );
  }
}
