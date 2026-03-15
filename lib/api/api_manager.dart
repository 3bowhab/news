import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/api/news_sources/news_sources.dart';

class ApiManager {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {'apiKey': ApiConstants.apiKey},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<NewsSources> getNewssources({String? category}) async {
    try {
      final response = await dio.get(
        '/v2/top-headlines/sources',
        queryParameters: {'category': category},
      );
      return NewsSources.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load news sources: ${e.message}');
    }
  }
}
