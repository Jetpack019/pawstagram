import 'package:flutter/material.dart';
import 'package:pawstagram/pages/homepage.dart';
import 'package:pawstagram/pages/page_settings.dart';
import 'package:pawstagram/pages/page_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/user': (context) => UserPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
