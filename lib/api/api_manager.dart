import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/api/api_end_points.dart';
import 'package:news/models/api_error/api_error.dart';
import 'package:news/models/news_respnse/news_respnse.dart';
import 'package:news/models/news_sources/news_sources.dart';

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
        ApiEndPoints.getNewsSources,
        queryParameters: {'category': category},
      );
      return NewsSources.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final apiError = ApiError.fromJson(e.response!.data);
        throw Exception(apiError.message ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }


  Future<NewsRespnse> getNewsBySource(String sourceId, int page) async {
    try {
      final response = await dio.get(
        ApiEndPoints.getNews,
        queryParameters: {'sources': sourceId, 'pageSize': 3, 'page': '$page'},
      );
      return NewsRespnse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final apiError = ApiError.fromJson(e.response!.data);
        throw Exception(apiError.message ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }


  Future<NewsRespnse> getNewsByQuery(String query, int page) async {
    try {
      final response = await dio.get(
        ApiEndPoints.getNews,
        queryParameters: {'q': query, 'pageSize': 3, 'page': '$page'},
      );
      return NewsRespnse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final apiError = ApiError.fromJson(e.response!.data);
        throw Exception(apiError.message ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }
}
