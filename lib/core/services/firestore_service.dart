import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honey_comp/core/services/database_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Request timed out. Please check your internet connection.');
      });
    } else {
      await firestore.collection(path).add(data).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Request timed out. Please check your internet connection.');
      });
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String,dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
        if (query['where'] != null) {
          var whereField = query['where'];
          var isEqualTo = query['isEqualTo'];
          data = data.where(whereField, isEqualTo: isEqualTo);
        }
      }
      var result= await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isUserExist(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
