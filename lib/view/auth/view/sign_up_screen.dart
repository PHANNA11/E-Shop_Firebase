import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../firebase/auth/firebase_controller.dart';
import '../../../widget/text_field_widget.dart';
import '../../home/view/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final emailController = TextEditingController();
  late final passController = TextEditingController();
  late final cpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: emailController,
                hindText: 'Enter E-mail',
                iconData: Icons.mail,
              ),
              TextFieldWidget(
                controller: passController,
                iconData: Icons.lock_outlined,
                hindText: 'Enter password',
                obscureText: true,
              ),
              TextFieldWidget(
                controller: cpassController,
                iconData: Icons.lock_outlined,
                hindText: 'Enter confirm-password',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () async {
                        Get.back();
                      },
                      color: Colors.blue,
                      child: const Text('Back'),
                    ),
                    CupertinoButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (passController.text == cpassController.text) {
                            await FirebaseController()
                                .createUser(
                                    emailController.text, passController.text)
                                .then((value) {
                              if (value != null) {
                                Get.back();
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please check password..!!!')),
                            );
                          }
                        }
                      },
                      color: Colors.green,
                      child: const Text('Register'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
