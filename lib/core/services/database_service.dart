abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<bool> isUserExist({required String path, required String documentId});

  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> data,
  });
}
