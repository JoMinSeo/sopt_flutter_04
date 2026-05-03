import 'package:sopt_flutter_04/core/network/api_client.dart';
import 'package:sopt_flutter_04/core/utils/constants.dart';
import 'package:sopt_flutter_04/features/song/data/models/song_dto.dart';

/// iTunes Search API 저수준 호출.
///
/// HTTP·JSON 디테일은 여기서 끝나고, 외부에는 [SongDto]만 노출한다.
/// 에러는 [ApiClient]가 던진 [ServerException]을 그대로 전파한다.
class SongRemoteDataSource {
  SongRemoteDataSource(this._client);
  final ApiClient _client;

  Future<List<SongDto>> searchSongs(String term) async {
    final uri = Uri.https(ApiConstants.itunesHost, ApiConstants.searchPath, {
      'term': term,
      'entity': 'song',
      'limit': '${ApiConstants.searchLimit}',
    });
    final body = await _client.getJson(uri);
    final results = body['results'] as List<dynamic>;
    return results
        .map((e) => SongDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SongDto>> getTracksOfAlbum(int collectionId) async {
    final uri = Uri.https(ApiConstants.itunesHost, ApiConstants.lookupPath, {
      'id': '$collectionId',
      'entity': 'song',
    });
    final body = await _client.getJson(uri);
    final results = body['results'] as List<dynamic>;

    // 첫 번째 결과는 wrapperType: "collection" (앨범 정보) 이므로 track만 필터.
    return results
        .cast<Map<String, dynamic>>()
        .where((e) => e['wrapperType'] == 'track')
        .map(SongDto.fromJson)
        .toList();
  }
}
