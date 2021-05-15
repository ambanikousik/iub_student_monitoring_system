import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iub_student_monitoring_system/domain/failure/failure.dart';
import 'package:iub_student_monitoring_system/domain/auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc(this.authProvider) : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(login: (e) async* {
      yield state.copyWith(loading: false);
      final Either<Failure, Unit> loginResult =
          await authProvider.login(e.userName, e.password);

      yield loginResult.fold(
          (l) => state.copyWith(loading: false, error: l.error),
          (r) => state.copyWith(loading: false, isLoggedIn: true));
    });
    // TODO: implement mapEventToState
  }
}
