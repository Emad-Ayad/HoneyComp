import 'package:honey_comp/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseService implements DataBaseService {
//   Supabase supabase = Supabase.instance;
//
//   @override
//   Future<void> addData(
//       {required String path,
//       required Map<String, dynamic> data,
//       String? docId}) async {
//     if (docId != null) {
//       await supabase.client.storage.
//     } else {
//       await firestore.collection(path).add(data);
//     }
//     throw UnimplementedError();
//   }
//
//   @override
//   Future getData(
//       {required String path, String? documentId, Map<String, dynamic>? query}) {
//     // TODO: implement getData
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool> isUserExist({required String path, required String documentId}) {
//     // TODO: implement isUserExist
//     throw UnimplementedError();
//   }
// }
