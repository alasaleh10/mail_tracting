part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSucsess extends RegisterState {}
final class RegisterExsitingAccount extends RegisterState {}

final class RegisterFaliuer extends RegisterState {}



