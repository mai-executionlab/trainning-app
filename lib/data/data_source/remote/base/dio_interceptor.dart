import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:training_app/injection.dart';
import 'package:training_app/shared_pref.dart';

@singleton
class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    //no need token

    //need token
    var token = getIt<SharedPref>().token;
    final RequestOptions newOption = options
      ..headers.addAll(token != null ? {'Authorization': 'Bearer $token'} : {});

    super.onRequest(newOption, handler);
  }


}
