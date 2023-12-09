import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop_app/view/home/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCart extends StatelessWidget {
  ProductCart({super.key, this.pro});
  ProductModel? pro;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 120,
                  width: 120,
                  imageUrl: pro!.image.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${pro!.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      pro!.discount == 0
                          ? Text(
                              '\$ ${pro!.price}',
                              style: const TextStyle(color: Colors.red),
                            )
                          : Row(
                              children: [
                                Text(
                                  '\$ ${pro!.price}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '\$ ${pro!.sellPrice}',
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
          pro!.discountLabel!.isEmpty
              ? const SizedBox()
              : Positioned(
                  top: 5,
                  right: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(pro!.discountLabel.toString()),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
