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
}
