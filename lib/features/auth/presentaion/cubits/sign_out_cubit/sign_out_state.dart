part of 'sign_out_cubit.dart';

@immutable
abstract class SignOutState {}

class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutSuccess extends SignOutState {}

class SignOutFailure extends SignOutState {
  final String errMessage;
  SignOutFailure({required this.errMessage});
}
