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
  //tab home (1)
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

  static DioRequest updateUserInfor({required Map<String, dynamic> body}) =>
      DioRequest(
        httpMethod: HttpMethod.put,
        path: '/guides/me',
        body: body,
      );

//tab spot - destination (2) -> ok
  static DioRequest getUserDestinations({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/destinations',
        parameters: {
          'primary_language_code': primaryLanguage,
          'secondary_language_code': secondLanguage,
          'page': page,
          'limit': limit,
        },
      );
  //tab skill (3) -> ok
  static DioRequest getUserSkills({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/skills',
        parameters: {
          'primary_language_code': primaryLanguage,
          'secondary_language_code': secondLanguage,
        },
      );
  //tab activity (4) -> ok
  static DioRequest getUserActivities({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
    bool mine = true, //get private activities
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/activities',
        parameters: {
          'primary_language_code': primaryLanguage,
          'secondary_language_code': secondLanguage,
          'page': page,
          'limit': limit,
          'mine': mine,
        },
      );

  //tab albums (5) -> ok
  static DioRequest getUserAlbums({
    required String username,
    required int page,
    int limit = 10, //items per page
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/albums',
        parameters: {
          'page': page,
          'limit': limit,
        },
      );

  static DioRequest getUserMedium({
    required String username,
    required int page,
    int limit = 10, //items per page
  }) =>
      DioRequest(
        httpMethod: HttpMethod.get,
        path: '/guides/$username/medium',
        parameters: {
          'page': page,
          'limit': limit,
        },
      );
}
