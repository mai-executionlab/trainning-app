import 'package:training_app/domain/entities/entity.dart';

abstract class GuideRepository {
  Future<ObjectResponse<Account>> getUserDetailInfor();
  Future<ObjectResponse<Account>> getUserShortInfor({
    required String username,
  });
  Future<ObjectResponse<GeneralInformation>> getUserGeneralInfor({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  });

  Future<ObjectResponse<bool>> updateUserInfor({
    required Map<String, dynamic> body,
  });

  Future<ListResponse<Destinations>> getUserDestinations({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
  });

  Future<ListResponse<Activity>> getUserActivities({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
  });

  Future<ListResponse<Photo>> getUserAlbums({
    required String username,
    required int page,
    int limit = 10, //items per page
  });

  Future<ListResponse<Photo>> getUserMedium({
    required String username,
    required int page,
    int limit = 10, //items per page
  });

  Future<ObjectResponse<Skill>> getUserSkills({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  });
}
