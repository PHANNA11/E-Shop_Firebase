import 'package:e_shop_app/firebase/auth/firebase_controller.dart';
import 'package:e_shop_app/view/home/view/home_screen.dart';
import 'package:e_shop_app/widget/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final emailController = TextEditingController();
  late final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () async {
                      var data = await FirebaseController()
                          .loginUser(emailController.text, passController.text);
                      if (data != null) {
                        Get.to(() => const HomeScreen());
                      } else {
                        Get.defaultDialog(
                          title: 'Authentication',
                        );
                      }
                    },
                    color: Colors.red,
                    child: const Text('Sign In'),
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text('Sign Up'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
