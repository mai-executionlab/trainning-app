import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_app/data/data_source/remote/index.dart';

void main() {
  const account = {"email": "demo@guide-navi.local", "password": "Password124"};
  AuthService authServices = AuthService(dioClient: DioClient());

  test("login", () async {
    try {
      var result = await authServices.login(
          email: account['email'] ?? '', password: account['password'] ?? '');
      debugPrint(result.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  });
}
