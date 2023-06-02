import 'package:flutter/material.dart';
import 'package:use_codepure_demo/utils/Constants.dart';

import 'bgimage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final userNameController = TextEditingController;
  // final passwordController = TextEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LoginPage"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const BgImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                              child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Enter UserName",
                                    labelText: "UserName"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password"),
                              )
                            ],
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //this navigator also use
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePage()));
                            Constants.prefs?.setBool("loggedIn", true);
                            Navigator.pushReplacementNamed(context, "/home");
                          },
                          child: const Text("Sign In"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
