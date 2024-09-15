import 'package:faketok_app/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          canvasColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 216, 11, 114))),
      title: 'FakeTok',
      home: const Tabs(),
    );
  }
}
