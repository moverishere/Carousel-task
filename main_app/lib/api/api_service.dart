import 'package:main_app/model/collection_model.dart';
import 'package:main_app/model/story_model.dart';

abstract class IApiService {
  Future<List<Collection>> fetchCollections();
  Future<List<Story>> fetchStories();
}
