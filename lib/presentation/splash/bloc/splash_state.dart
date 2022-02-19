part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadSuccessState extends SplashState {}

class SplashLoadErrorState extends SplashState {
  final String error;

  SplashLoadErrorState(this.error);
}
