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
  Future<ObjectResponse<bool>> updateUserInfor({
    required Map<String, dynamic> body,
  }) =>
      _guideService.updateUserInfor(body: body);

  @override
  Future<ListResponse<Destinations>> getUserDestinations({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10,
  }) =>
      _guideService.getUserDestinations(
        username: username,
        primaryLanguage: primaryLanguage,
        secondLanguage: secondLanguage,
        page: page,
      );

  @override
  Future<ListResponse<Activity>> getUserActivities({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10,
  }) =>
      _guideService.getUserActivities(
        username: username,
        primaryLanguage: primaryLanguage,
        secondLanguage: secondLanguage,
        page: page,
      );

  @override
  Future<ListResponse<Photo>> getUserAlbums({
    required String username,
    required int page,
    int limit = 10,
  }) =>
      _guideService.getUserAlbums(
        username: username,
        page: page,
      );
}
