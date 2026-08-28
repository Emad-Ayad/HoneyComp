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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Or`
  String get orText {
    return Intl.message('Or', name: 'orText', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to terms and conditions`
  String get pleaseAgreeToTerms {
    return Intl.message(
      'Please agree to terms and conditions',
      name: 'pleaseAgreeToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Error updating name. Try again.`
  String get errorUpdatingName {
    return Intl.message(
      'Error updating name. Try again.',
      name: 'errorUpdatingName',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching orders. Try again.`
  String get errorFetchingOrders {
    return Intl.message(
      'Error fetching orders. Try again.',
      name: 'errorFetchingOrders',
      desc: '',
      args: [],
    );
  }

  /// `Electronic Payment`
  String get electronicPayment {
    return Intl.message(
      'Electronic Payment',
      name: 'electronicPayment',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Floor, Apartment number..`
  String get floorApartmentNumber {
    return Intl.message(
      'Floor, Apartment number..',
      name: 'floorApartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a payment method`
  String get pleaseChoosePaymentMethod {
    return Intl.message(
      'Please choose a payment method',
      name: 'pleaseChoosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Your order has been confirmed successfully`
  String get orderConfirmedSuccessfully {
    return Intl.message(
      'Your order has been confirmed successfully',
      name: 'orderConfirmedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Electronic payment was canceled or failed.`
  String get electronicPaymentFailed {
    return Intl.message(
      'Electronic payment was canceled or failed.',
      name: 'electronicPaymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal:`
  String get subtotal {
    return Intl.message('Subtotal:', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery:`
  String get delivery {
    return Intl.message('Delivery:', name: 'delivery', desc: '', args: []);
  }

  /// `Order Summary:`
  String get orderSummary {
    return Intl.message(
      'Order Summary:',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your order`
  String get pleaseConfirmYourOrder {
    return Intl.message(
      'Please confirm your order',
      name: 'pleaseConfirmYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery on the spot`
  String get deliveryOnSpot {
    return Intl.message(
      'Delivery on the spot',
      name: 'deliveryOnSpot',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Best Selling`
  String get bestSelling2 {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling2',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `No products in cart`
  String get noProductsInCart {
    return Intl.message(
      'No products in cart',
      name: 'noProductsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Omda`
  String get welcomeOmda {
    return Intl.message(
      'Welcome Omda',
      name: 'welcomeOmda',
      desc: '',
      args: [],
    );
  }

  /// `Search for....`
  String get searchFor {
    return Intl.message(
      'Search for....',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Ramadan Offers`
  String get ramadanOffers {
    return Intl.message(
      'Ramadan Offers',
      name: 'ramadanOffers',
      desc: '',
      args: [],
    );
  }

  /// `30% Discount`
  String get discount30 {
    return Intl.message('30% Discount', name: 'discount30', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart successfully`
  String get productAddedToCart {
    return Intl.message(
      'Product added to cart successfully',
      name: 'productAddedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Product removed from cart successfully`
  String get productRemovedFromCart {
    return Intl.message(
      'Product removed from cart successfully',
      name: 'productRemovedFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get changesSavedSuccessfully {
    return Intl.message(
      'Changes saved successfully',
      name: 'changesSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `No previous orders`
  String get noPreviousOrders {
    return Intl.message(
      'No previous orders',
      name: 'noPreviousOrders',
      desc: '',
      args: [],
    );
  }

  /// `Under Review`
  String get underReview {
    return Intl.message(
      'Under Review',
      name: 'underReview',
      desc: '',
      args: [],
    );
  }

  /// `Shipped`
  String get shipped {
    return Intl.message('Shipped', name: 'shipped', desc: '', args: []);
  }

  /// `Delivered`
  String get delivered {
    return Intl.message('Delivered', name: 'delivered', desc: '', args: []);
  }

  /// `Canceled`
  String get canceled {
    return Intl.message('Canceled', name: 'canceled', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Logout`
  String get logout2 {
    return Intl.message('Logout', name: 'logout2', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get areYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'areYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Error sending request. Try again.`
  String get errorSendingRequest {
    return Intl.message(
      'Error sending request. Try again.',
      name: 'errorSendingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameHint {
    return Intl.message('Full Name', name: 'fullNameHint', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Online Payment`
  String get onlinePayment {
    return Intl.message(
      'Online Payment',
      name: 'onlinePayment',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Best Selling`
  String get bestSelling {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message('Shop Now', name: 'shopNow', desc: '', args: []);
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
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
