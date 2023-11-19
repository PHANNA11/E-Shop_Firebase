import 'package:e_shop_app/firebase/module/productFirebase.dart';
import 'package:e_shop_app/view/home/model/product_model.dart';
import 'package:e_shop_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final detailController = TextEditingController();
  final discountController = TextEditingController();
  final sellPriceController = TextEditingController();
  final linkImageController = TextEditingController();
  final discountLabelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Pro"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              hindText: 'product Name',
              controller: nameController,
            ),
            TextFieldWidget(
              sufficIconData: Icons.currency_exchange,
              controller: priceController,
              hindText: 'product Price',
            ),
            TextFieldWidget(
              controller: detailController,
              hindText: 'product Detail',
            ),
            TextFieldWidget(
              sufficIconData: Icons.percent,
              controller: discountController,
              hindText: 'product discount %',
              onChanged: (p0) {
                if (priceController.text.isNotEmpty) {
                  setState(() {
                    sellPriceController
                        .text = (double.parse(priceController.text) -
                            (double.parse(priceController.text) *
                                (double.parse(discountController.text) / 100)))
                        .toString();
                  });
                }
              },
            ),
            TextFieldWidget(
              controller: discountLabelController,
              hindText: 'Discount Label',
            ),
            TextFieldWidget(
              sufficIconData: Icons.currency_exchange,
              controller: sellPriceController,
              readOnly: true,
              hindText: 'product sell Price',
            ),
            TextFieldWidget(
              controller: linkImageController,
              hindText: 'product image link',
              onChanged: (p0) {
                setState(() {
                  linkImageController.text = p0;
                });
              },
            ),
            linkImageController.text.isEmpty
                ? const SizedBox()
                : Image(
                    height: 200,
                    width: 200,
                    image: NetworkImage(linkImageController.text))
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: () async {
          await ProductFireBase().addProduct(
            ProductModel(
              id: DateTime.now().microsecondsSinceEpoch,
              name: nameController.text,
              price: double.parse(priceController.text),
              discription: detailController.text,
              discount: double.parse(discountController.text),
              discountLabel: discountLabelController.text,
              sellPrice: double.parse(sellPriceController.text),
              image: linkImageController.text,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 208, 189, 21),
          ),
          child: const Center(
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
