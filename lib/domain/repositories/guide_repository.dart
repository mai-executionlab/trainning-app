import 'package:training_app/domain/entities/entity.dart';

abstract class GuideRepository{
  Future<ObjectResponse<Account>> getUserDetailInfor();
}
