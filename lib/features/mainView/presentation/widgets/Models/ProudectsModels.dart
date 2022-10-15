import 'package:flutter/material.dart';

class ProductModel {
  String? brandName;
  String? price;
  String? image;

  ProductModel({this.brandName, this.price, this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    brandName = json['BrandName'];
    price = json['Price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BrandName'] = this.brandName;
    data['Price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}

class ProductList{
  List<ProductModel> products;
  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> data ){
    List<ProductModel> dataList = [];
    dataList = data.map((e) {
      return ProductModel.fromJson(Map<String,dynamic>.from(e));
    }).toList();
    return ProductList(products: dataList);
  }

}