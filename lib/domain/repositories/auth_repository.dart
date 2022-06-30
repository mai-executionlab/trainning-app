import 'package:training_app/domain/entities/authentication.dart';
import 'package:training_app/domain/entities/response.dart';

abstract class AuthRepository {
  Future<ObjectResponse<Authentication>> login({
    required String email,
    required String password,
  });
}
