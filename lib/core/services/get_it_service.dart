import 'package:get_it/get_it.dart';
import 'package:honey_comp/core/repos/products_repo/products_repo.dart';
import 'package:honey_comp/core/repos/products_repo/products_repo_impl.dart';
import 'package:honey_comp/core/services/database_service.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/core/services/firestore_service.dart';
import 'package:honey_comp/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        dataBaseService: getIt<DataBaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(dataBaseService: getIt<DataBaseService>()),
  );
}
