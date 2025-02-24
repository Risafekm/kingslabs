import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;
  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    String getUrl = 'https://dummyjson.com/products';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        _productModel = ProductModel.fromJson(decodedJson);
      }
    } catch (e) {
      print('Error ${e.toString()}');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
