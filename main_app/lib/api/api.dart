import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<List<dynamic>> fetchCollections() async {
    final response = await dio.get(
      'https://steller.co/users/2166257779239552048/collections',
    );
    return response.data['data'];
  }

  Future<List<dynamic>> fetchStories() async {
    final response = await dio.get(
      'https://steller.co/feeds/users%2F2166257779239552048%2Ffeeds%2Fcollection-stories%3Fcontext%3D2279792120556423125',
      options: Options(headers: {'Accept': 'application/json'}),
    );
    return response.data['data'];
  }
}
