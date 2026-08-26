import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/core/helper_functions/backend_endpoints.dart';
import 'package:honey_comp/core/services/database_service.dart';
import 'package:honey_comp/features/auth/data/model/user_model.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/profile/domain/repos/profile_repo.dart';
import 'dart:convert';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/core/constants/constants.dart';

class ProfileRepoImpl implements ProfileRepo {
  final DataBaseService dataBaseService;

  ProfileRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, UserEntity>> updateUserName({required String userId, required String newName}) async {
    try {
      // Update in Firestore
      await dataBaseService.updateData(
        path: BackendEnpPoints.addUserDataEndPoint,
        docId: userId,
        data: {'name': newName},
      );

      // Fetch the updated user data
      var userData = await dataBaseService.getData(
        path: BackendEnpPoints.getUserDataEndPoint,
        documentId: userId,
      );
      
      var userEntity = UserModel.fromJson(userData);

      // Save to SharedPreferences
      var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
      await SharedPreferenceSingleton.setString(kIUserData, jsonData);

      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(errMessage: 'حدث خطأ أثناء تحديث الاسم. حاول مرة أخرى.'));
    }
  }
}
