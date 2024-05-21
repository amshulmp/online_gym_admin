// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/functions.dart';
import 'package:online_gym_admin/config/styles.dart';
import 'package:online_gym_admin/screeens/home.dart';
import 'package:online_gym_admin/widgets/button.dart';
import 'package:online_gym_admin/widgets/textbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcotroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Admin Sign in",
                style: Styles.title(context),
              ),
              Text(
                "Welcome back.Please sign in to",
                style: Styles.subtitlegrey(context),
              ),
              Text(
                "continue",
                style: Styles.subtitlegrey(context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Textbox(
                hideText: false,
                tcontroller: emailcotroller,
                type: TextInputType.emailAddress,
                hinttext: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              Textbox(
                hideText: true,
                tcontroller: passwordcotroller,
                type: TextInputType.visiblePassword,
                hinttext: 'Password',
                icon: Icons.lock,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              CustomLoginButton(
                  text: "Sign in",
                  onPress: () async{
                    await signin(emailcotroller.text.trim(), passwordcotroller.text.trim());
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
