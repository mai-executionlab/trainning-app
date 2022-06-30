class DioResponse {
  DioResponse({
    this.code,
    this.details,
    this.message,
    this.data,
  });

  final String? code;
  final List<dynamic>? details;
  final String? message;
  final dynamic data;

  factory DioResponse.fromJson(Map<String, dynamic> json) {
    return DioResponse(
      code: json['code'],
      details: json['details'],
      message: json['message'],
      data: json['data'],
    );
  }

  factory DioResponse.success(Map<String, dynamic> json) {
    return DioResponse(
      message: json['message'],
      data: json['data'],
    );
  }

  factory DioResponse.fail(Map<String, dynamic> json) {
    return DioResponse(
      code: json['code'],
      details: json['details'],
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'details': details,
      'message': message,
      'data': data,
    };
  }
}


class DioErrorResponse{
  DioErrorResponse({
    this.code,
    this.details,
    this.message,
 
  });

  final String? code;
  final List<dynamic>? details;
  final String? message;


  factory DioErrorResponse.fromJson(Map<String, dynamic> json) {
    return DioErrorResponse(
      code: json['code'],
      details: json['details'],
      message: json['message'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'details': details,
      'message': message,
    };
  }
}