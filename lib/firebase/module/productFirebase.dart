import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/view/home/model/product_model.dart';

class ProductFireBase {
  CollectionReference dataRef =
      FirebaseFirestore.instance.collection('shop_product');
  Future<void> addProduct(ProductModel? product) async {
    await dataRef.add(product!.toFirebase());
  }
}
