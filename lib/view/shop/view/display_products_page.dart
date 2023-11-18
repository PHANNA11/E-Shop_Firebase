import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/product_model.dart';
import '../../home/widget/product_cart.dart';

class DisplayProductPage extends StatefulWidget {
  const DisplayProductPage({super.key});

  @override
  State<DisplayProductPage> createState() => _DisplayProductPageState();
}

class _DisplayProductPageState extends State<DisplayProductPage> {
  CollectionReference dataRef =
      FirebaseFirestore.instance.collection('shop_product');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products in Shop'),
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
