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
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(errMessage: e.errMessage));
    }catch(e){
      return left(ServerFailure(errMessage: "There is Something wrong in creating email"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await dataBaseService.addData(
        path: BackendEnpPoints.addUserDataEndPoint, data: userEntity.toMap());
  }
}
