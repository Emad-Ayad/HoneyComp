import 'package:bloc/bloc.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(
        SignInFailure(errMessage: failure.errMessage),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    if (isClosed) return;
    emit(SignInLoading());
    try {
      final result = await authRepo.signInWithGoogle();
      if (isClosed) return;
      result.fold(
        (failure) => emit(SignInFailure(errMessage: failure.errMessage)),
        (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  Future<void> signInWithFacebook() async {
    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(
        SignInFailure(errMessage: failure.errMessage),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }
}
