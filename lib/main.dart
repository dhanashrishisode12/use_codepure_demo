import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:use_codepure_demo/pages/home_page.dart';
import 'package:use_codepure_demo/pages/home_page_fb.dart';
import 'package:use_codepure_demo/utils/Constants.dart';

import 'pages/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      title: "Catlog App",
      debugShowCheckedModeBanner: false,
      home: Constants.prefs?.getBool("loggedIn") == true
          ? const HomePage()
          : const LoginPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/homepage": (context) => const HomePage(),
        "/homepagefb": ((context) => HomePageFB()),
      },
    ),
  );
}
