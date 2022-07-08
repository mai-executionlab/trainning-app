import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:training_app/injection.dart';
import 'package:training_app/shared_pref.dart';

@singleton
class DioIntercepter extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    //no need token

    //need token
    final token = getIt<SharedPref>().token;
    // print('token ${getIt<SharedPref>().token}');

    final RequestOptions newOption = options
      ..headers.addAll(token != null ? {'Authorization': 'Bearer $token'} : {});

    print('onRequest ${newOption.headers}');
    // handler.next(newOption);
    super.onRequest(newOption, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print('onResponse $response');
    super.onResponse(response, handler);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   print('onError $err');
  //   super.onError(err, handler);
  // }
}
