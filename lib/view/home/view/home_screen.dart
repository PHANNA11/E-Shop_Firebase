import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/view/auth/view/sign_in_screen.dart';
import 'package:e_shop_app/view/home/model/product_model.dart';
import 'package:e_shop_app/view/home/widget/product_cart.dart';
import 'package:flutter/material.dart';

import '../../../firebase/auth/firebase_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference dataRef =
      FirebaseFirestore.instance.collection('shop_product');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: SafeArea(
                child: ListTile(
          onTap: () async {
            await FirebaseController().logOut().then((value) =>
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                    (route) => false));
          },
          title: const Text('Log Out'),
        ))),
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: dataRef.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Icon(
                  Icons.info,
                  color: Colors.red,
                  size: 40,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.grey, color: Colors.yellow),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var pro =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return ProductCart(
                    pro: ProductModel.fromFireBase(pro),
                  );
                },
              );
            }
          },
        ));
  }
}
