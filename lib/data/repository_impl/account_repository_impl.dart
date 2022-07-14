import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/account.dart';
import 'package:training_app/domain/entities/response.dart';
import 'package:training_app/domain/repositories/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountService _accountService;
  AccountRepositoryImpl(DioClient dioClient)
      : _accountService = AccountService(dioClient: dioClient);
  @override
  Future<ObjectResponse<Account>> getAccount() => _accountService.getAccount();
}
