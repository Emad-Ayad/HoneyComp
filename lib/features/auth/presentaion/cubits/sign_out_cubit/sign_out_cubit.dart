import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());

  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await authRepo.signOut();
      if (!isClosed) emit(SignOutSuccess());
    } catch (e) {
      if (!isClosed) emit(SignOutFailure(errMessage: e.toString()));
    }
  }
}
