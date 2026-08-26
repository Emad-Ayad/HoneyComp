import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/profile/domain/repos/profile_repo.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final UserEntity user;
  EditProfileSuccess({required this.user});
}

class EditProfileFailure extends EditProfileState {
  final String errMessage;
  EditProfileFailure({required this.errMessage});
}

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileRepo profileRepo;

  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());

  Future<void> updateUserName({required String newName}) async {
    emit(EditProfileLoading());
    try {
      final user = getUser();
      var result = await profileRepo.updateUserName(userId: user.id, newName: newName);
      result.fold(
        (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
        (userEntity) => emit(EditProfileSuccess(user: userEntity)),
      );
    } catch (e) {
      emit(EditProfileFailure(errMessage: e.toString()));
    }
  }
}
