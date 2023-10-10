import 'package:flutter_ecommerce/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce/services/firestore_services.dart';
import 'package:flutter_ecommerce/utilities/api_path.dart';
import '../models/product.dart';
import '../models/user_data.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();

  Stream<List<Product>> newProductStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(AddToCartModel product);

  Stream<List<AddToCartModel>> myProductsCart();
}

class FiresStoreDatabase implements Database {
  final _services = FireStoreServices.instance;
  final String uid;

  FiresStoreDatabase(this.uid);

  @override
  Stream<List<Product>> salesProductStream() => _services.collectionsStream(
      // الباث تابع الع documents الي هو بداخل collection
      path: ApiPath.products(),
      builder: (data, documentId) => Product.fromMap(
            data!,
            documentId,
          ),
      queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<Product>> newProductStream() => _services.collectionsStream(
        // الباث تابع الع document الي هو بداخل collection
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(
          data!,
          documentId,
        ),
      );

  @override
  Future<void> setUserData(UserData userData) => _services.setData(
        path: ApiPath.users(userData.uid),
        data: userData.toMap(),
      );

  @override
  Future<void> addToCart(AddToCartModel product) async =>
      await _services.setData(
        path: ApiPath.addToCart(uid, product.productId),
        data: product.toMap(),
      );

  @override
  Stream<List<AddToCartModel>> myProductsCart() => _services.collectionsStream(
      path: ApiPath.myProductsCart(uid),
      builder: (data, documentId) => AddToCartModel.fromMap(data!, documentId));
}
