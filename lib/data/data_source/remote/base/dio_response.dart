class DioResponse {
  DioResponse({
    this.code,
    this.details,
    this.message,
    this.data,
    this.meta,
  });

  final String? code;
  final List<dynamic>? details;
  final String? message;
  final dynamic data;
  final dynamic meta;

  factory DioResponse.fromJson(Map<String, dynamic> json) {
    return DioResponse(
      code: json['code'],
      details: json['details'],
      message: json['message'],
      data: json['data'],
      meta: json['meta'],
    );
  }

  factory DioResponse.success(Map<String, dynamic> json) {
    return DioResponse(
      message: json['message'],
      data: json['data'],
      meta: json['meta'],
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

  List<Map<String, dynamic>> toList() {
    return List<Map<String, dynamic>>.from(data);
  }
}

class DioErrorResponse {
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
