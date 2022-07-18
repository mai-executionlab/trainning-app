import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/injection.dart';
import 'package:training_app/shared_pref.dart';

class AuthService {
  AuthService({required this.dioClient});
  final DioClient dioClient;

  Future<ObjectResponse<Authentication>> login({
    required String email,
    required String password,
  }) async {
    final DioRequest request =
        AuthRequest.login(email: email, password: password);

    final DioResponse response = await dioClient.execute(request: request);
    final Authentication object = Authentication.fromJson(response.data);

    return ObjectResponse(object: object);
  }

  Future<ObjectResponse<bool>> logout() async {
    final DioRequest request = AuthRequest.logout(
        refreshToken: getIt<SharedPref>().refreshToken ?? '');

    final DioResponse response = await dioClient.execute(request: request);

    return ObjectResponse(object: true);
  }
}
