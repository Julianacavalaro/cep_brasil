import 'package:cep_brasil/feature/presenter/page/conselho_page.dart';
import 'package:flutter/material.dart';

import 'feature/presenter/page/home.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/conselho-page': (context) => const ConselhoPage(),
      },
    ); 
  }
}
