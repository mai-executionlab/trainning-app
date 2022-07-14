import 'package:training_app/data/data_source/remote/base/dio_request.dart';

class LanguageRequest {
  LanguageRequest._();

  static DioRequest getLanguages() => DioRequest(
        httpMethod: HttpMethod.get,
        path: '/languages',
      );
}
