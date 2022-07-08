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

  static DioRequest getUserGeneralInfor({required String username}) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/general_info',
      );
}
