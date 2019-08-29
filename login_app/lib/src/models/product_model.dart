// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String id;
    String name;
    double price;
    bool available;
    String photoUrl;

    Product({
        this.id,
        this.name = '',
        this.price = 0.0,
        this.available = false,
        this.photoUrl,
    });

    factory Product.fromJson(Map<String, dynamic> json) => new Product(
        id          : json["id"],
        name        : json["name"],
        price       : json["price"],
        available   : json["available"],
        photoUrl    : json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "name"      : name,
        "price"     : price,
        "available" : available,
        "photoUrl"  : photoUrl,
    };
}
