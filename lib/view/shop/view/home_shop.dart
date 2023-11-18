import 'package:e_shop_app/core/data/constant_data.dart';
import 'package:e_shop_app/view/shop/view/add_product_page.dart';
import 'package:e_shop_app/view/shop/view/display_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'edit_product_page.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.count(
        crossAxisCount: 2,
        // mainAxisSpacing: 2,
        // crossAxisSpacing: 2,
        childAspectRatio: 10 / 14,
        children: List.generate(listShopOption.length,
            (index) => shopOptionWidget(data: listShopOption[index])),
      )),
    );
  }

  Widget shopOptionWidget({Map<String, dynamic>? data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => {
          if (data['page'] == 'add')
            {Get.to(() => const AddProductPage())}
          else if (data['page'] == 'display')
            {Get.to(() => const DisplayProductPage())}
          else
            {Get.to(() => const EditProductPage())}
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: data!['backgroundColor'],
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(data['image']),
                height: 100,
                width: 100,
              ),
              const Spacer(),
              Text(
                data['title'].toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
