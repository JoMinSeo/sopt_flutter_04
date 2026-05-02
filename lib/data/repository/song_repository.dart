import 'package:sopt_flutter_04/data/data_source/song_local_data_source.dart';
import 'package:sopt_flutter_04/data/data_source/song_remote_data_source.dart';
import 'package:sopt_flutter_04/data/dto/song_dto.dart';
import 'package:sopt_flutter_04/data/entity/song.dart';

/// 곡 도메인 데이터 접근 추상화.
///
/// 원격(API)과 로컬(즐겨찾기) 데이터 소스를 조합해
/// "즐겨찾기 상태가 채워진 [Song]"을 일관되게 반환한다.
abstract class SongRepository {
  /// 검색 결과. 각 [Song]은 현재 즐겨찾기 상태를 반영한다.
  Future<List<Song>> searchSongs(String term);

  /// 같은 앨범의 트랙 목록. 각 [Song]은 현재 즐겨찾기 상태를 반영한다.
  /// (필터·정렬 정책은 호출자가 판단)
  Future<List<Song>> getTracksOfAlbum(int collectionId);

  /// 즐겨찾기 토글 — 영속 저장소의 trackId 집합을 갱신한다.
  Future<void> toggleFavorite(int trackId);
}

class SongRepositoryImpl implements SongRepository {
  SongRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final SongRemoteDataSource _remoteDataSource;
  final SongLocalDataSource _localDataSource;

  @override
  Future<List<Song>> searchSongs(String term) async {
    final dtos = await _remoteDataSource.searchSongs(term);
    return _mergeFavorites(dtos);
  }

  @override
  Future<List<Song>> getTracksOfAlbum(int collectionId) async {
    final dtos = await _remoteDataSource.getTracksOfAlbum(collectionId);
    return _mergeFavorites(dtos);
  }

  @override
  Future<void> toggleFavorite(int trackId) async {
    final favorites = await _localDataSource.loadFavorites();
    final updated = Set<int>.from(favorites);
    updated.contains(trackId) ? updated.remove(trackId) : updated.add(trackId);
    await _localDataSource.saveFavorites(updated);
  }

  /// DTO 목록에 즐겨찾기 상태를 매칭해 [Song] 목록으로 변환한다.
  Future<List<Song>> _mergeFavorites(List<SongDto> dtos) async {
    final favorites = await _localDataSource.loadFavorites();
    return dtos
        .map(
          (dto) => dto.toEntity().copyWith(
            isFavorite: favorites.contains(dto.trackId),
          ),
        )
        .toList();
  }
}
