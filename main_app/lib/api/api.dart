import 'package:dio/dio.dart';
import 'package:main_app/api/api_service.dart';
import 'package:main_app/model/collection_model.dart';
import 'package:main_app/model/story_model.dart';

part 'api_validation.dart';
part 'api_exception.dart';

class ApiService implements IApiService {
  final Dio dio;
  final String baseUrl = 'https://steller.co';

  ApiService({required this.dio}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }

  @override
  Future<List<Collection>> fetchCollections() async {
    try {
      final response = await dio.get('/users/2166257779239552048/collections');

      if (response.statusCode != 200) {
        throw ApiException(
          'Failed to fetch collections',
          statusCode: response.statusCode,
        );
      }

      return _parseApiListResponse(response, Collection.fromJson);
    } on DioException catch (e) {
      throw ApiException(
        'Network error: ${e.message}',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Unexpected error: $e');
    }
  }

  @override
  Future<List<Story>> fetchStories() async {
    try {
      final response = await dio.get(
        '/feeds/users%2F2166257779239552048%2Ffeeds%2Fcollection-stories%3Fcontext%3D2279792120556423125',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          'Failed to fetch stories',
          statusCode: response.statusCode,
        );
      }

      return _parseApiListResponse(response, Story.fromJson);
    } on DioException catch (e) {
      throw ApiException(
        'Network error: ${e.message}',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Unexpected error: $e');
    }
  }
}
