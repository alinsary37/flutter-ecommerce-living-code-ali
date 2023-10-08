import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreServices {
  FireStoreServices._();

  static final instance = FireStoreServices._();
  final _fireStore = FirebaseFirestore.instance;

  // ToDo 1)function setData راح ندز او نعدل ديتا الى فاير ستور
  // ToDo 2)function deleteData راح نخذف ديتا من فاير ستور
  // ToDo 3)function documentsStream راح نجيب ديتا من كوليكشن داخل دوكيومنت من فاير ستور
  // ToDo 4)function collectionsStream راح نجيب ديتا من دوكيومنت داخل كوليكشن من فاير ستور
  // void لان راح تخزن معلومات في فايرستور لذللك ميحتاج ترجع شي
  // اسم فنكشن setData يعني يضيف ديتا ويغير ديتا
  Future<void> setData({
    //   // المكان الي راح تتخزن بي ديتا
    required String path,
    //   // الديتا
    required Map<String, dynamic> data,
  }) async {
    //   // ب فاير ستور الديتا تتخزن ب دوكيومنت والدوك يومنت تتخزن ب كوللكشن لكن الديتا تتخزن ب دوكيومنت لذلك خلينه .doc
    final reference = _fireStore.doc(path);
    debugPrint("Request Data :$data");
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint("Path :$path");
    await reference.delete();
  }

  // اجيب ديتا من  الي موجود بداخل دوكيومينت
  // اني مااعرف نوع الديتا لذلك اريد الديتا حسب المستخدم الي راح يدخله لذلك خليت T
  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _fireStore.doc(path);
    // snapshots اجيب الديتا وكذلك الكولكشن الي موجود داخل دوكيومنت
    final snapshots = reference.snapshots();
    // الغاية من بلدر فنكشن هو علمود الفاير ستور يرجعلك  نوع ديتا مثل الي دخلت من خلال فنكشن formMap موجودة ب product.dart
    return snapshots.map((snapshot) => builder(
          snapshot.data(),
          snapshot.id,
        ));
    // لكن هنا راح يرجعلك فقط ماب
    // return snapshots.map((snapshots) => snapshots.data,
  }

  // اجيب ديتا من الكوليكشن الي موجود بداخل دوكيومينت
  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    // كوري للفلتره  تابع الى فاير ستور مثلاً  نريد نجيب الديتا الي سعرة فقط فوك ١٠٠$
    Query Function(Query query)? queryBuilder,
    // هاي حتى نرتبهم
    // lhs = left hands
    // rhs = right hands
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    // يحتوي snapshots(ركز ع حرف s الجمع) الي هو reference للكوليكشن  الي يحتوي ع عدة documents لكن احنه نريد document واحد فقط
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      //  لذلك اخذنه snapshot.docs (بدون حرف s) الي يحتوي ع ديتا document الواحد  حتى ترجع نوع الديتا الي دخلت الى فاير ستور
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          // where هي الي راح تفلتر بداخل فاير ستور ليس داخل تطبيق حتى من ميستهلك من قدرة التطبيق
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
