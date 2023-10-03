import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/services/firestore_services.dart';

import '../services/product.dart';

abstract class Database {
  Stream<List<Product>> productStream();
}

class FiresStoreDatabase implements Database {
  final _services = FireStoreServices.instance;

  @override
  Stream<List<Product>> productStream() => _services.collectionsStream(
        path: 'products/',
        builder: (data, documentId) => Product.fromMap(
          data!,
          documentId,
        ),
      );
}
