import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/response.dart';
import 'package:training_app/domain/entities/language.dart';
import 'package:training_app/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl extends LanguageRepository {
  final LanguageService _languageService;
  LanguageRepositoryImpl(DioClient dioClient)
      : _languageService = LanguageService(dioClient: dioClient);
  @override
  Future<ListResponse<Language>> getLanguages() =>
      _languageService.getLanguages();
}
