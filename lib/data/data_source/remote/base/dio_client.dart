import 'package:dio/dio.dart';
import 'package:training_app/data/data_source/remote/index.dart';

class DioClient {
  final Dio _dio;
  final DioInterceptor interceptor;

  DioClient({
    BaseURL baseURL = BaseURLs.demo,
    required this.interceptor,
  }) : _dio = Dio(BaseOptions(baseUrl: baseURL.url))
          ..interceptors.add(interceptor);
  Future<DioResponse> execute({
    required DioRequest request,
  }) async {
    Options options = Options(
      contentType: Headers.jsonContentType,
      method: request.method,
    );

    try {
      Response response = await _dio.request(
        request.path,
        queryParameters: request.parameters,
        data: request.body,
        options: options,
      );

      return DioResponse.success(response.data);
    } on DioError catch (e) {
      throw DioErrorResponse.fromJson(e.response?.data);
      // } on SocketException catch (e) {
      //   throw e.message;
      // } on HttpException catch (e) {
      //   throw e.message;
    } on Exception catch (e) {
      // e
      // debugPrint(e.toString());
      throw e.toString();
    }
  }
}
