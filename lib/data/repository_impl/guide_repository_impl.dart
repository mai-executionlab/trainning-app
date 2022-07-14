import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/domain/repositories/guide_repository.dart';

class GuideRepositoryImpl extends GuideRepository {
  final GuideService _guideService;
  GuideRepositoryImpl(DioClient dioClient)
      : _guideService = GuideService(dioClient: dioClient);

  @override
  Future<ObjectResponse<Account>> getUserDetailInfor() =>
      _guideService.getUserDetailInfor();

  @override
  Future<ObjectResponse<GeneralInformation>> getUserGeneralInfor({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) =>
      _guideService.getUserGeneralInfor(
        username: username,
        primaryLanguage: primaryLanguage,
        secondLanguage: secondLanguage,
      );

  @override
  Future<ObjectResponse<Account>> getUserShortInfor({
    required String username,
  }) =>
      _guideService.getUserShortInfor(username: username);

  @override
  Future<ObjectResponse<bool>> updateUserInfor(
          {required Map<String, dynamic> body}) =>
      _guideService.updateUserInfor(body: body);
}
