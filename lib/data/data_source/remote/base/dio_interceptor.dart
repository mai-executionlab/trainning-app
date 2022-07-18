import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:training_app/injection.dart';
import 'package:training_app/shared_pref.dart';

@singleton
class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    //no need token

    //need token
    var token = getIt<SharedPref>().token;
    // print('token ${getIt<SharedPref>().token}');
    // token =
    // 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJqdGkiOiJkYTkwYjk3YTc4ZGU2ZjVhNzgzZDhkZmM4ZTY1ZWI3YiIsImlhdCI6MTY1ODExMTExNiwiZXhwIjoxNjU4MTk3NTE2fQ.HheDF-QAvq0WRJ4AIewnIvNbNj4p-Ub-eSIJIhXZ1TM';
    final RequestOptions newOption = options
      ..headers.addAll(token != null ? {'Authorization': 'Bearer $token'} : {});

    print('onRequest ${newOption.headers} \n path ${newOption.path}');
    // handler.next(newOption);
    super.onRequest(newOption, handler);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   print('onError $err');
  //   super.onError(err, handler);
  // }
}
