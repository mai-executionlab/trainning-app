import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/data/repository_impl/account_repository_impl.dart';
import 'package:training_app/data/repository_impl/auth_repository_impl.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';
import 'package:training_app/data/repository_impl/language_repository_impl.dart';

final interceptorProvider = Provider((ref) => DioInterceptor());

final dioProvider =
    Provider(((ref) => DioClient(interceptor: ref.watch(interceptorProvider))));

final authRepoProvider =
    Provider(((ref) => AuthRepositoryImpl(ref.watch(dioProvider))));

final guideRepoProvider =
    Provider(((ref) => GuideRepositoryImpl(ref.watch(dioProvider))));

final accountRepoProvider =
    Provider(((ref) => AccountRepositoryImpl(ref.watch(dioProvider))));

final languageRepoProvider =
    Provider(((ref) => LanguageRepositoryImpl(ref.watch(dioProvider))));
