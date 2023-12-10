import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/view/home/model/product_model.dart';

import 'firebase_storage.dart';

class ProductFireBase {
  CollectionReference dataRef =
      FirebaseFirestore.instance.collection('shop_product');
  Future<void> addProduct(ProductModel? product) async {
    await dataRef.add(product!.toFirebase());
  }

  Future<void> deleteProduct({required String docId}) async {
    await dataRef.doc(docId).delete();
  }

  Future<void> updateProduct(
      {required String docId, ProductModel? product}) async {
    await dataRef.doc(docId).set(product!.toFirebase()).whenComplete(() async {
      await FireBaseStorageController().deleteImage(imageUrl: product.image!);
    });
  }
}
