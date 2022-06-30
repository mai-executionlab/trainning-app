
import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioClient _dioClient;

  AuthRepositoryImpl(DioClient dioClient) : _dioClient = dioClient;

  @override
  Future<ObjectResponse<Authentication>> login({
    required String email,
    required String password,
  }) =>
      AuthService(dioClient: _dioClient)
          .login(email: email, password: password);
}
