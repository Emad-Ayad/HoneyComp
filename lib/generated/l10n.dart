// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Welcome in `
  String get welcome {
    return Intl.message('Welcome in ', name: 'welcome', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with HoneyComp. Explore our wide range of premium natural honey and enjoy the best deals and high quality.`
  String get onboard1 {
    return Intl.message(
      'Discover a unique shopping experience with HoneyComp. Explore our wide range of premium natural honey and enjoy the best deals and high quality.',
      name: 'onboard1',
      desc: '',
      args: [],
    );
  }

  /// `Explore and Shop`
  String get welcome2 {
    return Intl.message(
      'Explore and Shop',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// `Discover the finest, handpicked honey varieties. Explore detailed descriptions, stunning images, and customer reviews to find the perfect honey that suits your taste.`
  String get onboard2 {
    return Intl.message(
      'Discover the finest, handpicked honey varieties. Explore detailed descriptions, stunning images, and customer reviews to find the perfect honey that suits your taste.',
      name: 'onboard2',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have Account ? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t Have Account ? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Make an Account `
  String get makeAccount {
    return Intl.message(
      'Make an Account ',
      name: 'makeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `By creating an account, you agree to our terms and conditions.`
  String get terms {
    return Intl.message(
      'By creating an account, you agree to our terms and conditions.',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signUp {
    return Intl.message('SignUp', name: 'signUp', desc: '', args: []);
  }

  /// `SignUp`
  String get newAccount {
    return Intl.message('SignUp', name: 'newAccount', desc: '', args: []);
  }

  /// `Already have an Account? `
  String get haveAccount {
    return Intl.message(
      'Already have an Account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
