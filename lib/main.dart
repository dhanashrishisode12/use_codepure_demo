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
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 8)],
                gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
            child: const Text(" i am a box"),
          ),
        ));
  }
}
