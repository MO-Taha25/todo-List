import 'package:flutter/material.dart';
import 'package:todo/auth/registration_screen.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/widget/default_elevated_botton.dart';
import 'package:todo/widget/default_text_from_feld.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextFromField(
                  controller: emailController,
                  hintext: 'Login',
                  validator: (value) {
                    if (value == null || value.trim().length < 5) {
                      return "Email can'n be less 5 character";
                    } else {
                      null;
                    }
                  }),
              SizedBox(
                height: 12,
              ),
              DefaultTextFromField(
                  controller: passwordController,
                  hintext: 'Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.trim().length < 8) {
                      return "Password can'n be less 8 character";
                    } else {
                      null;
                    }
                  }),
              SizedBox(
                height: 32,
              ),
              DefaultElevatedBottom(label: 'Login', onPressed: Login),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(RegistrScreen.routName),
                child: Text(
                  "Dont'n have accent",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void Login() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
    }
  }
}
