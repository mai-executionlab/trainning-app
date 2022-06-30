class DioRequest {
  DioRequest({
    required HttpMethod httpMethod,
    required this.path,
   this.parameters,
  this.body,
  }) : method = httpMethod.name.toUpperCase();
  String method;
  String path;
  dynamic parameters;
  dynamic body;
}

enum HttpMethod { get, post, put }

// extension HttpMethodsExtension on HttpMethod {
//   String get method {
//     return name.toUpperCase();
//   }
// }
