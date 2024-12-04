import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/services/shared_pref/pref_keys.dart';
import '../../../../core/utils/services/shared_pref/shared_pref.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }

  final AuthRepos _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

//Login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (loginData) async {
        final token = loginData.data.login.accessToken ?? '';
        final user = await _repo.userRole(token);
        // Save: accessToken + userId + userRole
        await SharedPref().setString(PrefKeys.accessToken, token);
        await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref().setString(PrefKeys.userRole, user.userRole ?? '');
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
