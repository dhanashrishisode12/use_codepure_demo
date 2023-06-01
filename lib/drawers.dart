import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Dhanashri Shisode"),
            accountEmail: Text("dhanashrishisode17@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.pinclipart.com/picdir/big/218-2189254_free-online-avatars-kid-characters-family-vector-for.png")),
          ),
          const ListTile(
            trailing: Icon(Icons.add),
            title: Text("Addition"),
            subtitle: Text(
              "Add numbers",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            leading: Icon(Icons.edit),
          ),
          ListTile(
            tileColor: Colors.blue,
            mouseCursor: MaterialStateMouseCursor.clickable,
            leading: const Icon(Icons.home),
            title: const Text("Home Page"),
            trailing: const Icon(CupertinoIcons.refresh),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
