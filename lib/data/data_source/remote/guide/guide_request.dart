import 'package:training_app/data/data_source/remote/base/dio_request.dart';

class GuideRequest {
  GuideRequest._();

  static DioRequest getUserDetailInfor() => DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/me',
      );
  static DioRequest getUserShortInfor({required String username}) => DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/info',
      );

  static DioRequest getUserGeneralInfor({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/general_info',
        parameters: {
          'primary_language_code': primaryLanguage,
          'secondary_language_code': secondLanguage,
        },
      );

  static DioRequest updateUserInfor({ required Map<String, dynamic> body}) => DioRequest(
        httpMethod: HttpMethod.put,
        path: '/guides/me',
        body: body,
      );
}
