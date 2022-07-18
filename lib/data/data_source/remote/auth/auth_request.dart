import 'package:training_app/data/data_source/remote/index.dart';

class AuthRequest {
  AuthRequest._();

  static DioRequest login({
    required String email,
    required String password,
  }) =>
      DioRequest(
        httpMethod: HttpMethod.post,
        path: '/login',
        body: {
          'email': email,
          'password': password,
        },
      );

  static DioRequest logout({
    required String refreshToken,
  }) =>
      DioRequest(
        httpMethod: HttpMethod.delete,
        path: '/logout',
        body: {
          "refresh_token": refreshToken,
          "name": "",
          "birthday": ""
        },
      );
}
