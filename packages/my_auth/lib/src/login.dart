library my_auth;

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
    this.input1 = "email",
    this.input2 = "password",
    this.obscureText = false,
    this.loginButtonText = "Se connecter",
    this.registerButtonText = "Enregistrer",
    this.forgotPasswordButtonText = "Mot de passe oublié",
    required this.onAuthenticated,
    this.onRegisterButtonPressed,
    this.onPasswordForgotButtonPressed,
  }) : super(key: key);
  final String loginButtonText;
  final String registerButtonText;
  final String forgotPasswordButtonText;
  final String input1;
  final String input2;
  final bool obscureText;

  /*
  {
    "email": "francis@smirltech.com",
    "password": "123456",
    }
   */
  final ValueChanged<Map<String, dynamic>> onAuthenticated;
  final VoidCallback? onRegisterButtonPressed;
  final VoidCallback? onPasswordForgotButtonPressed;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: input1,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: input2,
                  ),
                  obscureText: obscureText,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  child: Text(loginButtonText),
                  onPressed: () {
                    onAuthenticated(<String, dynamic>{
                      input1: emailController.text,
                      input2: passwordController.text,
                    });
                  },
                ),
                if (onRegisterButtonPressed != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).unselectedWidgetColor,
                    ),
                    onPressed: onRegisterButtonPressed,
                    child: Text(registerButtonText),
                  ),
                if (onRegisterButtonPressed != null)
                  const SizedBox(
                    height: 10,
                  ),
                if (onPasswordForgotButtonPressed != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).unselectedWidgetColor,
                      ),
                      onPressed: onPasswordForgotButtonPressed,
                      child: Text(forgotPasswordButtonText),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
