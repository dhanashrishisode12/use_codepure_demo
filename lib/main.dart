import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "home", home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("home"),
        ),
        body: Container(
          child: Center(child: const Text("hello")),
        ));
  }
}
