import 'package:e_shop_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
            ),
            TextFieldWidget(
              hindText: 'product Price',
            ),
            TextFieldWidget(
              hindText: 'product Detail',
            ),
            TextFieldWidget(
              hindText: 'product discount %',
            ),
            TextFieldWidget(
              readOnly: true,
              hindText: 'product sell Price',
            ),
            TextFieldWidget(
              hindText: 'product sell Price',
            ),
          ],
        ),
      ),
    );
  }
}
