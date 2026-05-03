import 'package:sopt_flutter_04/core/error/result.dart';
import 'package:sopt_flutter_04/core/usecases/usecase.dart';
import 'package:sopt_flutter_04/features/song/domain/repositories/song_repository.dart';

/// 즐겨찾기를 토글하는 UseCase.
class ToggleFavorite implements UseCase<void, int> {
  ToggleFavorite(this._repository);
  final SongRepository _repository;

  @override
  Future<Result<void>> call(int params) {
    return _repository.toggleFavorite(params);
  }
}
