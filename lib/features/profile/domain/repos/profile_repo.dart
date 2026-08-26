import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> updateUserName({required String userId, required String newName});
}
