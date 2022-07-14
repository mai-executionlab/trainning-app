import 'package:training_app/domain/entities/entity.dart';

abstract class LanguageRepository {
  Future<ListResponse<Language>> getLanguages();
}
