import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreServices {
  FireStoreServices._();

  static final instance = FireStoreServices._();
  final _fireStore = FirebaseFirestore.instance;

  // void لان راح تخزن معلومات في فايرستور لذللك ميحتاج ترجع شي
  // اسم فنكشن setData يعني يضيف ديتا ويغير ديتا
  Future<void> setData({
    // المكان الي راح تتخزن بي ديتا
    required String path,
    // الديتا
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    debugPrint("Request Data :$data");
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint("Path :$path");
    await reference.delete();
  }

  // اجيب ديتا من كوليكشن الي موجود بداخل دوكيومينت
  // اني مااعرف نوع الديتا لذلك اريد الديتا حسب المستخدم الي راح يدخله لذلك خليت T
  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _fireStore.doc(path);
    // snapshots اجيب الديتا وكذلك الكولكشن الي موجود داخل دوكيومنت
    final snapshots = reference.snapshots();
    return snapshots.map((snapshots) => builder(
          snapshots.data(),
          snapshots.id,
        ));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
