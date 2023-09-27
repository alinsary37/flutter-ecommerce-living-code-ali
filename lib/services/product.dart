import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'other',
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      discountValue: 20),
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      ),
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      discountValue: 20),
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      discountValue: 20),
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      discountValue: 20), Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
      ), Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'other',
     ),



];
