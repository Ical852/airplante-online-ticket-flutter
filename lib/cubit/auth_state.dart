part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  UserModel user;
  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}


class AuthFailed extends AuthState {
  String error;

  AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}