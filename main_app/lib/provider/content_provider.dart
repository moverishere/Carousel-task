import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:main_app/api/api.dart';
import 'package:main_app/repository/content_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  return dio;
});

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(dio: ref.watch(dioProvider));
});

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(api: ref.watch(apiServiceProvider));
});

final collectionsProvider = FutureProvider.autoDispose<List<String>>((
  ref,
) async {
  final repository = ref.watch(contentRepositoryProvider);
  return await repository.getCollectionImages();
});

final storiesProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final repository = ref.watch(contentRepositoryProvider);
  return await repository.getStoryImages();
});
