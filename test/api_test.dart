import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_app/data/data_source/remote/index.dart';

void main() {
  const account = {"email": "demo@guide-navi.local", "password": "Password124"};
  var interceptor = DioInterceptor();
  var dio = DioClient(interceptor: interceptor);
  var guideService = GuideService(dioClient: dio);

  // test("login", () async {
  //   try {
  //     var result = await authServices.login(
  //         email: account['email'] ?? '', password: account['password'] ?? '');
  //     debugPrint(result.toString());
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // });

  test("guide skills", () async {
    try {
      var result = await guideService.getUserSkills(
          username: 'hang', primaryLanguage: 'ja', secondLanguage: 'en');
      debugPrint(result.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  });
}
