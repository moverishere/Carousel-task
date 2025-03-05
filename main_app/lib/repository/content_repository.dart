import 'package:main_app/api/api_service.dart';

class ContentRepository {
  final IApiService api;

  ContentRepository({required this.api});

  Future<List<String>> getCollectionImages() async {
    try {
      final collections = await api.fetchCollections();
      return collections
          .map((collection) => collection.coverImageUrl)
          .where((url) => url.isNotEmpty)
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getStoryImages() async {
    try {
      final stories = await api.fetchStories();
      return stories
          .map((story) => story.coverSrc)
          .where((url) => url.isNotEmpty)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
