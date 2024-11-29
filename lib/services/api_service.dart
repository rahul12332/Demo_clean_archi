import 'package:dio/dio.dart';

import '../core/costant/url_constant.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchPosts() async {
    final response = await _dio.get(postsEndpoint);
    return response.data;
  }

  Future<Map<String, dynamic>> fetchPostDetails(int postId) async {
    final response = await _dio.get('$postsEndpoint/$postId');
    return response.data;
  }
}
