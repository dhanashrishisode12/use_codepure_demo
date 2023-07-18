import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:use_codepure_demo/utils/Constants.dart';
import 'dart:convert';

import 'drawers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  var myText = "change me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("home"),
          actions: <Widget>[
            IconButton(
                icon:const Icon(Icons.exit_to_app),
                onPressed: () {
                  Constants.prefs?.setBool("loggedIn", false);
                  Navigator.pushReplacementNamed(context, "/login");
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(data[index]["title"]),
                        subtitle: Text("ID:${data[index]["id"]}"),
                        leading: Image.network(data[index]["url"]),
                      ),
                    );
                  },
                  itemCount: data.length)
              : const Center(
                  child: CircularProgressIndicator(),
                ),

          // child: Column(
          //   children: const <Widget>[
          // const BgImage(),
          // const SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   myText,
          //   style: const TextStyle(
          //       fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     controller: _nameController,
          //     keyboardType: TextInputType.name,
          //     decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         labelText: "Name",
          //         hintText: " enter the name"),
          //   ),
          // ),
          // ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myText = _nameController.text;
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
        drawer: const MyDrawer());
  }
}
