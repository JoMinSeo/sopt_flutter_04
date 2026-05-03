import 'package:sopt_flutter_04/core/error/result.dart';
import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';

/// 곡 도메인 데이터 접근의 추상화.
///
/// 구현체(SongRepositoryImpl)는 data 계층에 위치하며, 원격(API)과
/// 로컬(즐겨찾기) 데이터 소스를 조합해 즐겨찾기 상태가 채워진 [Song]을
/// 일관되게 반환한다.
abstract interface class SongRepository {
  /// 검색 결과. 각 [Song]은 현재 즐겨찾기 상태를 반영한다.
  Future<Result<List<Song>>> searchSongs(String term);

  /// 같은 앨범의 트랙 목록. 각 [Song]은 현재 즐겨찾기 상태를 반영한다.
  Future<Result<List<Song>>> getTracksOfAlbum(int collectionId);

  /// 즐겨찾기 토글 — 영속 저장소의 trackId 집합을 갱신한다.
  Future<Result<void>> toggleFavorite(int trackId);
}
