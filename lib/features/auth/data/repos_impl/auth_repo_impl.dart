import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/custom_exception.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/features/auth/data/model/user_model.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password, name: name);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    }
  }
}
