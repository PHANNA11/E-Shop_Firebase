import 'package:e_shop_app/view/home/data/product_key.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  double? discount;
  String? discountLabel;
  double? sellPrice;
  String? discription;
  String? image;
  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.discountLabel,
      this.sellPrice,
      this.discription,
      this.image});
  Map<String, dynamic> toFirebase() {
    return {
      ProductFirebaseKey().id: id,
      ProductFirebaseKey().name: name,
      ProductFirebaseKey().price: price,
      ProductFirebaseKey().discount: discount,
      ProductFirebaseKey().discountLabel: discountLabel,
      ProductFirebaseKey().sellPrice: sellPrice,
      ProductFirebaseKey().discription: discription,
      ProductFirebaseKey().image: image,
    };
  }

  ProductModel.fromFireBase(Map<String, dynamic> map)
      : id = map[ProductFirebaseKey().id],
        name = map[ProductFirebaseKey().name],
        price = double.parse(map[ProductFirebaseKey().price].toString()),
        discount = double.parse(map[ProductFirebaseKey().discount].toString()),
        discountLabel = map[ProductFirebaseKey().discountLabel],
        sellPrice =
            double.parse(map[ProductFirebaseKey().sellPrice].toString()),
        discription = map[ProductFirebaseKey().discription],
        image = map[ProductFirebaseKey().image];
}
