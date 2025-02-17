import 'package:firebase_auth/firebase_auth.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.id});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? "", email: user.email ?? "", id: user.uid);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: 'name', email: 'email', id: 'id');
  }
}
