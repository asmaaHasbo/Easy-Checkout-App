import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required String token,
    Map<String, dynamic>? headres,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: headres ?? {'Authorization': 'Bearer $token'},
      ),
    );

    return response;
  }
}
