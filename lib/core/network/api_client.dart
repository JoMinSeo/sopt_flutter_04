import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sopt_flutter_04/core/error/exceptions.dart';

/// HTTP 클라이언트 래퍼.
///
/// 200 OK가 아닌 응답이나 네트워크 에러는 [ServerException]으로 변환되어
/// 호출자(DataSource)는 단일 예외 타입만 처리하면 된다.
class ApiClient {
  ApiClient([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  Future<Map<String, dynamic>> getJson(Uri uri) async {
    try {
      final res = await _client.get(uri);
      if (res.statusCode != 200) {
        throw ServerException('HTTP ${res.statusCode}: ${res.reasonPhrase}');
      }
      return jsonDecode(res.body) as Map<String, dynamic>;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Network error: $e');
    }
  }
}
