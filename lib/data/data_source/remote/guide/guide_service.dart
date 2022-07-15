import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';

class GuideService {
  GuideService({required this.dioClient});
  final DioClient dioClient;

  Future<ObjectResponse<Account>> getUserDetailInfor() async {
    final DioRequest request = GuideRequest.getUserDetailInfor();

    final DioResponse response = await dioClient.execute(request: request);
    final Account object = Account.fromJson(response.data);

    return ObjectResponse(object: object);
  }

  Future<ObjectResponse<Account>> getUserShortInfor({
    required String username,
  }) async {
    final DioRequest request =
        GuideRequest.getUserShortInfor(username: username);

    final DioResponse response = await dioClient.execute(request: request);
    final Account object = Account.fromJson(response.data);

    return ObjectResponse(object: object);
  }

  Future<ObjectResponse<GeneralInformation>> getUserGeneralInfor({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    final DioRequest request = GuideRequest.getUserGeneralInfor(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
    );

    final DioResponse response = await dioClient.execute(request: request);
    final GeneralInformation object =
        GeneralInformation.fromJson(response.data);

    return ObjectResponse(object: object);
  }

  Future<ObjectResponse<bool>> updateUserInfor({
    required Map<String, dynamic> body,
  }) async {
    print(body);
    final DioRequest request = GuideRequest.updateUserInfor(body: body);

    final DioResponse response = await dioClient.execute(request: request);

    return ObjectResponse(object: response.message == 'ok');
  }

  Future<ObjectResponse<Skill>> getUserSkills({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  }) async {
    final DioRequest request = GuideRequest.getUserSkills(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
    );

    final DioResponse response = await dioClient.execute(request: request);
    Skill object = Skill.fromJson(response.data);
    return ObjectResponse(object: object);
  }

  Future<ListResponse<Destinations>> getUserDestinations({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
  }) async {
    final DioRequest request = GuideRequest.getUserDestinations(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
      page: page,
    );
    final DioResponse response = await dioClient.execute(request: request);
    List<Destinations> list =
        response.toList().map((e) => Destinations.fromJson(e)).toList();
    return ListResponse(list: list);
  }

  Future<ListResponse<Activity>> getUserActivities({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
    required int page,
    int limit = 10, //items per page
  }) async {
    final DioRequest request = GuideRequest.getUserActivities(
      username: username,
      primaryLanguage: primaryLanguage,
      secondLanguage: secondLanguage,
      page: page,
    );

    final DioResponse response = await dioClient.execute(request: request);

    List<Activity> list =
        response.toList().map((e) => Activity.fromJson(e)).toList();
    return ListResponse(list: list);
  }

  Future<ListResponse<Media>> getUserAlbums({
    required String username,
    required int page,
    int limit = 10, //items per page
  }) async {
    final DioRequest request = GuideRequest.getUserAlbums(
      username: username,
      page: page,
    );

    final DioResponse response = await dioClient.execute(request: request);

    List<Media> list = response.toList().map((e) => Media.fromAlbum(e)).toList();

    return ListResponse(list: list);
  }

  Future<ListResponse<Media>> getUserMedium({
    required String username,
    required int page,
    int limit = 10, //items per page
  }) async {
    final DioRequest request = GuideRequest.getUserMedium(
      username: username,
      page: page,
    );

    final DioResponse response = await dioClient.execute(request: request);

    List<Media> list = response.toList().map((e) => Media.fromJson(e)).toList();

    return ListResponse(list: list);
  }
}
