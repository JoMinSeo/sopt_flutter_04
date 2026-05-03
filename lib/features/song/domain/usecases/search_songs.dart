import 'package:sopt_flutter_04/core/error/result.dart';
import 'package:sopt_flutter_04/core/usecases/usecase.dart';
import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';
import 'package:sopt_flutter_04/features/song/domain/repositories/song_repository.dart';

/// 검색어로 곡을 검색하는 UseCase.
class SearchSongs implements UseCase<List<Song>, String> {
  SearchSongs(this._repository);
  final SongRepository _repository;

  @override
  Future<Result<List<Song>>> call(String params) {
    return _repository.searchSongs(params);
  }
}
