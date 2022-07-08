import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';

class AccountService {
  AccountService({required this.dioClient});
  final DioClient dioClient;

  Future<ObjectResponse<Account>> getAccount() async {
    final DioRequest request = AccountRequest.getAccount();

    final DioResponse response = await dioClient.execute(request: request);
    final Account object = Account.fromJson(response.data);

    return ObjectResponse(object: object);
  }
}
