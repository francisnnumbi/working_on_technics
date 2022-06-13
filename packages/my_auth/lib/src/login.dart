library my_auth;

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key, this.title = "Se connecter", required this.onAuthenticated})
      : super(key: key);
  final String title;

  /*
  {
    "email": "francis@smirltech.com",
    "password": "123456",
    }
   */
  final ValueChanged<Map<String, dynamic>> onAuthenticated;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    onAuthenticated(<String, dynamic>{
                      "email": emailController.text,
                      "password": passwordController.text,
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
