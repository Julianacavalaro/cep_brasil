import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConselhoPage extends StatefulWidget {
  const ConselhoPage({super.key});

  @override
  State<ConselhoPage> createState() => _ConselhoPageState();
}

class _ConselhoPageState extends State<ConselhoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API de conselho"),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        surfaceTintColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
