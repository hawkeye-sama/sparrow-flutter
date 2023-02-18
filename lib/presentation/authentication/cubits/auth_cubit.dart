import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthCubit extends Cubit<AuthStatus> {
  AuthCubit() : super(AuthStatus.unknown);

  void checkAuthStatus() {
    // Check authentication status, e.g. by checking if a user is logged in
    final isLoggedIn = false;

    if (isLoggedIn) {
      emit(AuthStatus.authenticated);
    } else {
      emit(AuthStatus.unauthenticated);
    }
  }

  void logIn() {
    // Perform login logic here
    emit(AuthStatus.authenticated);
  }

  void logOut() {
    // Perform logout logic here
    emit(AuthStatus.unauthenticated);
  }
}
