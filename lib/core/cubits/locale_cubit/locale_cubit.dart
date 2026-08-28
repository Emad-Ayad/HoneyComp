import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial(const Locale('ar'))) {
    loadLocale();
  }

  void loadLocale() {
    final languageCode = SharedPreferenceSingleton.getString('language_code');
    if (languageCode != null && languageCode.isNotEmpty) {
      emit(LocaleChanged(Locale(languageCode)));
    } else {
      emit(const LocaleChanged(Locale('ar')));
    }
  }

  Future<void> changeLocale(String languageCode) async {
    await SharedPreferenceSingleton.setString('language_code', languageCode);
    emit(LocaleChanged(Locale(languageCode)));
  }
}
