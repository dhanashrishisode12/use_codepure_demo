import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/Constants.dart';
import 'drawers.dart';

class HomePageFB extends StatelessWidget {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  HomePageFB({super.key});

  Future getdata() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("home"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  Constants.prefs?.setBool("loggedIn", false);
                  Navigator.pushReplacementNamed(context, "/login");
                }),
          ],
        ),
        body: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text("fetch something"),
                  );
                  break;
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("some error occure"),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text(snapshot.data[index]["title"]),
                          subtitle: Text("ID:${snapshot.data[index]["id"]}"),
                          leading: Image.network(snapshot.data[index]["url"]),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // myText = _nameController.text;
            // setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
        drawer: const MyDrawer());
  }
}
