import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/data/data_source/remote/index.dart';
import 'package:training_app/data/repository_impl/account_repository_impl.dart';
import 'package:training_app/data/repository_impl/auth_repository_impl.dart';
import 'package:training_app/data/repository_impl/guide_repository_impl.dart';

final interceptorProvider = Provider((ref) => DioIntercepter());

final dioProvider =
    Provider(((ref) => DioClient(intercepter: ref.watch(interceptorProvider))));

final authRepoProvider =
    Provider(((ref) => AuthRepositoryImpl(ref.watch(dioProvider))));

final guideRepoProvider =
    Provider(((ref) => GuideRepositoryImpl(ref.watch(dioProvider))));

final accountRepoProvider =
    Provider(((ref) => AccountRepositoryImpl(ref.watch(dioProvider))));