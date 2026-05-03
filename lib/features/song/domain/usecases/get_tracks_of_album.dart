import 'package:sopt_flutter_04/core/error/result.dart';
import 'package:sopt_flutter_04/core/usecases/usecase.dart';
import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';
import 'package:sopt_flutter_04/features/song/domain/repositories/song_repository.dart';

/// 같은 앨범의 트랙 목록을 가져오는 UseCase.
class GetTracksOfAlbum implements UseCase<List<Song>, int> {
  GetTracksOfAlbum(this._repository);
  final SongRepository _repository;

  @override
  Future<Result<List<Song>>> call(int params) {
    return _repository.getTracksOfAlbum(params);
  }
}
