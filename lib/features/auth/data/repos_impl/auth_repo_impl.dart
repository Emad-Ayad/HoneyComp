import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:honey_comp/core/errors/custom_exception.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/core/helper_functions/backend_endpoints.dart';
import 'package:honey_comp/core/services/database_service.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/features/auth/data/model/user_model.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImplementation(
      {required this.dataBaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, id: user.uid);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.errMessage));
    } catch (e) {
      return left(ServerFailure(
          errMessage: "There is Something wrong in creating email"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);

      var isUserExist = await dataBaseService.isUserExist(
          path: BackendEnpPoints.addUserDataEndPoint, documentId: user.uid);

      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseService.isUserExist(
          path: BackendEnpPoints.addUserDataEndPoint, documentId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await dataBaseService.addData(
        path: BackendEnpPoints.addUserDataEndPoint,
        data: userEntity.toMap(),
        docId: userEntity.id);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseService.getData(
        path: BackendEnpPoints.getUserDataEndPoint, documentId: uid);
    return UserModel.fromJson(userData);
  }
}
