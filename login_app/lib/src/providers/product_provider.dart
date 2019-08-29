

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/src/models/product_model.dart';

class ProductProvider{

  final String _URL = 'https://flutter-mluna.firebaseio.com';

  Future<bool> post(Product product) async {

    final url = '$_URL/product.json';
    final response = await http.post(url, body: productToJson(product));
    final decodedData = json.decode(response.body);
    return true;

  }

  Future<bool> put(Product product) async {
    final url = '$_URL/product/${product.id}.json';
    final response = await http.put(url, body: productToJson(product));
    final decodedData = json.decode(response.body);
    return true;
  }

  Future<List<Product>> get() async{

    final url = '$_URL/product.json';
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<Product> products = new List();

    if(decodedData == null){
      return [];
    }

    decodedData.forEach((key, value){
      final prod = Product.fromJson(value);
      prod.id = key;
      products.add(prod);
    });

    return products;
    
  }

  delete(String id) async {
    
    final url = '$_URL/product/$id.json';
    await http.delete(url);

  }

}