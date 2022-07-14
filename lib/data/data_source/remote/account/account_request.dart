import 'package:training_app/data/data_source/remote/base/dio_request.dart';

class AccountRequest {
  AccountRequest._();

  static DioRequest getAccount() => DioRequest(
        httpMethod: HttpMethod.get,
        path: '/accounts/me',
      );
}
