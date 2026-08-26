
 import 'dart:convert';
import 'dart:developer';

import 'package:honey_comp/core/constants/constants.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/model/user_model.dart';

UserEntity getUser(){
  var jsonData = SharedPreferenceSingleton.getString(kIUserData);
  if (jsonData == null || jsonData.trim().isEmpty) {
    log('No user data found in SharedPreferences, returning guest/default user.');
    return UserEntity(name: 'Guest', email: 'guest@example.com', id: 'guest123');
  }
  try {
    var userEntity = UserModel.fromJson(jsonDecode(jsonData));
    log(userEntity.name);
    return userEntity;
  } catch (e) {
    log('Error decoding user data: $e');
    return UserEntity(name: 'Guest', email: 'guest@example.com', id: 'guest123');
  }
}