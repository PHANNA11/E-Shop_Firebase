import 'package:e_shop_app/view/auth/view/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  get _getInitFirebase {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Icon(
                Icons.info,
                size: 35,
                color: Colors.red,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const SignInScreen();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: _getInitFirebase,
      debugShowCheckedModeBanner: false,
    );
  }
}
