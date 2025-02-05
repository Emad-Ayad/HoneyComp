import 'package:get_it/get_it.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
