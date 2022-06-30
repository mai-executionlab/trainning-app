import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:training_app/data/data_source/remote/base/dio_client.dart';
import 'package:training_app/data/data_source/remote/base/dio_response.dart';
import 'package:training_app/data/repository_impl/auth_repository_impl.dart';

enum AuthStatus { init, processing, success, fail, empty }

class AuthState {
  final AuthStatus status;
  final String? message;
  AuthState({this.status = AuthStatus.init, this.message});

  AuthState.success({
    this.status = AuthStatus.success,
    this.message,
  });

  AuthState.processing({
    this.status = AuthStatus.processing,
    this.message,
  });

  AuthState.fail({
    this.status = AuthStatus.fail,
    required this.message,
  });
}

class LoginNotifier extends StateNotifier<AuthState> {
  LoginNotifier({required this.repositoryImpl}) : super(AuthState());

  final AuthRepositoryImpl repositoryImpl;

  void login({required String email, required String pw}) async {
    if (email.isEmpty || pw.isEmpty) {
      state = AuthState(message: 'Empty fields', status: AuthStatus.empty);
      return;
    }
    try {
      state = AuthState.processing();
      // var result = await repositoryImpl.login(email: email, password: pw);
      await Future.delayed(const Duration(seconds: 3));
      // debugPrint(result.object.accessToken);
      // save token here
      state = AuthState.success();
    } catch (e) {
      if (e is DioErrorResponse) {
        state = AuthState.fail(message: e.message);
      }
    }
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, AuthState>((ref) {
  return LoginNotifier(repositoryImpl: ref.watch(authRepoProvider));
});

final authRepoProvider =
    Provider(((ref) => AuthRepositoryImpl(ref.watch(dioProvider))));

final dioProvider = Provider(((ref) => DioClient()));
