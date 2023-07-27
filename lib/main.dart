import 'package:flutter/material.dart';
import 'package:petapp/page/page_home.dart';
import 'package:petapp/page/page_messages.dart';
import 'package:petapp/page/page_setting.dart';
import 'package:petapp/page/page_chat.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      home: HomePage(),
      routes: {
        '/messages': (context) => MessagesPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
