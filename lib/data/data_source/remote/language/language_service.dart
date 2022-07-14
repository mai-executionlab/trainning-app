import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/domain/entities/entity.dart';

class LanguageService {
  LanguageService({required this.dioClient});
  final DioClient dioClient;

  Future<ListResponse<Language>> getLanguages() async {
    final DioRequest request = LanguageRequest.getLanguages();

    final DioResponse response = await dioClient.execute(request: request);
    final List<Language> list = List<Map<String, dynamic>>.from(response.data)
        .map((x) => Language.fromJson(x))
        .toList();
    // response.data.map((e) => Language.fromJson(e)).toList();

    return ListResponse(list: list);
  }
}
