import 'package:sopt_flutter_04/core/error/result.dart';
import 'package:sopt_flutter_04/features/song/data/datasources/song_local_data_source.dart';
import 'package:sopt_flutter_04/features/song/data/datasources/song_remote_data_source.dart';
import 'package:sopt_flutter_04/features/song/data/models/song_dto.dart';
import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';
import 'package:sopt_flutter_04/features/song/domain/repositories/song_repository.dart';

/// [SongRepository] 구현체.
///
/// 원격(API) DTO 목록과 로컬(SharedPreferences) 즐겨찾기 집합을 조합해
/// 즐겨찾기 상태가 채워진 [Song]을 반환한다. DataSource가 던진 [Exception]은
/// [Result.failure]로 감싸 도메인 계층으로 전달한다.
class SongRepositoryImpl implements SongRepository {
  SongRepositoryImpl(this._remote, this._local);

  final SongRemoteDataSource _remote;
  final SongLocalDataSource _local;

  @override
  Future<Result<List<Song>>> searchSongs(String term) async {
    try {
      final dtos = await _remote.searchSongs(term);
      return Result.success(await _mergeFavorites(dtos));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<Song>>> getTracksOfAlbum(int collectionId) async {
    try {
      final dtos = await _remote.getTracksOfAlbum(collectionId);
      return Result.success(await _mergeFavorites(dtos));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> toggleFavorite(int trackId) async {
    try {
      final favorites = await _local.loadFavorites();
      final updated = Set<int>.from(favorites);
      updated.contains(trackId)
          ? updated.remove(trackId)
          : updated.add(trackId);
      await _local.saveFavorites(updated);
      return const Success<void>(null);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  Future<List<Song>> _mergeFavorites(List<SongDto> dtos) async {
    final favorites = await _local.loadFavorites();
    return dtos
        .map(
          (dto) => dto.toEntity().copyWith(
                isFavorite: favorites.contains(dto.trackId),
              ),
        )
        .toList();
  }
}
