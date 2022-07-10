import 'package:training_app/domain/entities/entity.dart';

abstract class GuideRepository{
  Future<ObjectResponse<Account>> getUserDetailInfor();
  Future<ObjectResponse<Account>> getUserShortInfor({
    required String username,
  });
  Future<ObjectResponse<GeneralInformation>> getUserGeneralInfor({
    required String username,
    required String primaryLanguage,
    required String secondLanguage,
  });
}
