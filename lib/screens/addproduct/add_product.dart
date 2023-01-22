import 'dart:io';
import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

GlobalKey<FormState> addProductsFieldKey = GlobalKey();
File images1 = File("");

class _AddProductState extends State<AddProduct> {
  pickedImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        images1 = File(image!.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                appbar(
                    leadingIcon: Icons.arrow_back_ios,
                    centerText: "Add Product",
                    actionIcon: Icons.settings),
                mainContainer(
                  context: context,
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Form(
                        key: addProductsFieldKey,
                        child: Column(
                          children: [
                            imageCard(context),
                            chooseImageButton(onPressed: () {
                              pickedImage();
                            }),
                            textFormField(productName, "PRODUCT NAME :"),
                            textFormField(productPrice, "PRODUCT PRICE :"),
                            textFormField(productQTY, "PRODUCT QTY :"),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: floatingActionButton(context: context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// descriptionField(),
// alignText1(),
// alignText2(),
// textFormField(suplierName, "NAME :"),
// textFormField(suplierPrice, "price :"),
// textFormField(suplierContact, "contact :"),
// textFormField(suplierEmailId, "EmailID :"),
