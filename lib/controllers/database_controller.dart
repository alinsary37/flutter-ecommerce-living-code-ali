import 'package:flutter_ecommerce/services/firestore_services.dart';
import 'package:flutter_ecommerce/utilities/api_path.dart';
import '../services/product.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();
  Stream<List<Product>> newProductStream();
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
    queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0)
      );

  @override
  Stream<List<Product>> newProductStream() => _services.collectionsStream(
    // الباث تابع الع document الي هو بداخل collection
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(
      data!,
      documentId,
    ),
  );
}
