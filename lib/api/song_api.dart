import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopt_flutter_04/models/song.dart';

Future<List<Song>> searchSongs(String term) async {
  // Uri.https로 만들면 검색어가 자동으로 URL 인코딩됩니다
  // (공백이나 한글이 들어가도 안전)
  final uri = Uri.https('itunes.apple.com', '/search', {
    'term': term,
    'entity': 'song',
    'limit': '10',
  });

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('곡 검색 실패: ${response.statusCode}');
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final results = body['results'] as List<dynamic>;
  return results.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
}

Future<List<Song>> lookupAlbumSongs(int collectionId) async {
  final uri = Uri.https('itunes.apple.com', '/lookup', {
    'id': '$collectionId',
    'entity': 'song',
  });

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('앨범 트랙 조회 실패: ${response.statusCode}');
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final results = body['results'] as List<dynamic>;

  // 첫 번째 결과는 wrapperType: "collection"(앨범 정보)이므로 track만 필터
  return results
      .cast<Map<String, dynamic>>()
      .where((e) => e['wrapperType'] == 'track')
      .map(Song.fromJson)
      .toList();
}
