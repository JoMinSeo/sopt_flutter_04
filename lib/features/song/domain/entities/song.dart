import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

/// 도메인 엔티티 — 앱 전체가 사용하는 곡 표현.
///
/// JSON / HTTP / SharedPreferences 같은 외부 라이브러리를 모른다.
/// 직렬화 책임은 SongDto가 진다. [isFavorite]는 도메인 개념이며
/// DTO에는 존재하지 않는다 — Repository가 로컬 즐겨찾기 집합과
/// 머지하여 채워준다.
@freezed
abstract class Song with _$Song {
  const factory Song({
    required int trackId,
    required int collectionId,
    required String trackName,
    required String artistName,
    required String collectionName,
    String? artworkUrl100,
    required int trackTimeMillis,
    int? trackNumber,
    @Default(false) bool isFavorite,
  }) = _Song;
}
