import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sopt_flutter_04/data/dto/song_dto.dart';

/// iTunes Search API 저수준 호출 캡슐화.
///
/// HTTP·JSON 디테일은 여기서 끝나고, 외부에는 [SongDto]만 노출한다.
class SongRemoteDataSource {
  Future<List<SongDto>> searchSongs(String term) async {
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
    return results
        .map((e) => SongDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SongDto>> getTracksOfAlbum(int collectionId) async {
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

    // 첫 번째 결과는 wrapperType: "collection"(앨범 정보)이므로 track만 필터.
    return results
        .cast<Map<String, dynamic>>()
        .where((e) => e['wrapperType'] == 'track')
        .map(SongDto.fromJson)
        .toList();
  }
}
