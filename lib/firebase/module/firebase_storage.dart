import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FireBaseStorageController {
  final productImagePath = '/images/products/';
  RxString selectImage = ''.obs;
  Future uploadImageToFireStore({required File? fileImage}) async {
    RxString imageName = DateTime.now().microsecondsSinceEpoch.toString().obs;
    if (fileImage != null) {
      log('file test');
      await FirebaseStorage.instance
          .ref()
          .child(productImagePath)
          .child("${imageName.value}.png")
          .putFile(File(fileImage.path))
          .then((p0) async {
        downloadImage(imageName: imageName.value);
      });
    }
  }

  Future downloadImage({required String? imageName}) async {
    await FirebaseStorage.instance
        .ref()
        .child(productImagePath)
        .child('${imageName!}.png')
        .getDownloadURL()
        .then((value) {
      selectImage(value);
    });
  }

  // =====  Camera Image =====

  openCamera() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.camera);
    await uploadImageToFireStore(fileImage: File(getImage!.path));
  }

  openGallary() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    await uploadImageToFireStore(fileImage: File(getImage!.path));
  }
}
