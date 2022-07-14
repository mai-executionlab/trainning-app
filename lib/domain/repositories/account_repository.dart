import 'package:training_app/domain/entities/entity.dart';

abstract class AccountRepository {
  Future<ObjectResponse<Account>> getAccount();
}
