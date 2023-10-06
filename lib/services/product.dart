import 'package:flutter_ecommerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final int? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'other',
    this.rate,
  });

  // فاير ستور ياخذ الديتا الي بيه ماب فقط لذلك الديتا تم تحويها الى ماب
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  // الديتا الي جايه من الفاير ستور عبارة عن ماب لذلك تتحول هنا حسب نوع الديتا الي اندزت الى الفاير ستور فبل متتحول الى ماب
  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
}


List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 'T-Shirt',
      price: 300,
      imgUrl: AppAssets.temProductAssets1,
      category: 'Clothes',
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
