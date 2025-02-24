import 'package:main_app/api/api.dart';

class ContentRepository {
  final ApiService api;

  ContentRepository({required this.api});

  Future<List<String>> getCollectionImages() async {
    final rawCollections = await api.fetchCollections();
    return rawCollections
        .map<String>((e) => e["cover_image_url"] as String? ?? "")
        .toList();
  }

  Future<List<String>> getStoryImages() async {
    final rawStories = await api.fetchStories();

    return rawStories.map<String>((element) {
      final storyMap = element['story'] as Map<String, dynamic>?;
      if (storyMap == null) {
        return '';
      }

      final itemMap = storyMap['item'] as Map<String, dynamic>?;
      if (itemMap == null) {
        return '';
      }

      final coverSrc = itemMap['cover_src'] as String? ?? '';
      return coverSrc;
    }).toList();
  }
}
