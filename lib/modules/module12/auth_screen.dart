import 'package:flutter/material.dart';
import 'package:my_auth/my_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String info = "Hey, tu peux t'authentifier ici";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Column(
        children: [
          Login(
            onAuthenticated: (Map<String, dynamic> map) {
              setState(() {
                info =
                    "Authentifié avec email: ${map['email']}, password: ${map['password']}";
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(info),
        ],
      ),
    );
  }
}
