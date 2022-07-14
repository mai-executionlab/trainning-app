import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl(DioClient dioClient)
      : _authService = AuthService(dioClient: dioClient);

  @override
  Future<ObjectResponse<Authentication>> login({
    required String email,
    required String password,
  }) =>
      _authService.login(email: email, password: password);
}
