
abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> isUserExist({required String path, required String documentId});
}
