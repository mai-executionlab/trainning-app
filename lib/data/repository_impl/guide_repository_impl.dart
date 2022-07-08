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
}
