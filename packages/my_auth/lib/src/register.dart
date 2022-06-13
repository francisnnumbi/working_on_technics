library my_auth;

import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register(
      {Key? key, this.title = "Se connecter", required this.onAuthenticated})
      : super(key: key);
  final String title;

  /*
  {
    "email": "francis@smirltech.com",
    "password": "123456",
    "name": "Francis",
    "birthday": "2020-01-01",
    "sexe": "m",
    }
   */
  final ValueChanged<Map<String, dynamic>> onAuthenticated;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController sexeController = TextEditingController();
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
