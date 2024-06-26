// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:cinemasync/services/authorization.dart';
import 'package:cinemasync/pages/account-page.dart';

class SignUp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('SignUp build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "Username"),
                controller: usernameController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
                controller: passwordController,
              ),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () async {
                  try {
                    await Authorization().createUser(usernameController.text,
                        emailController.text, passwordController.text);
                  } catch (e) {
                    print(e);
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
