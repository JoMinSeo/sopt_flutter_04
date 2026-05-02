/// 도메인 모델 — 앱 전체가 사용하는 곡 표현.
///
/// JSON / HTTP / SharedPreferences 같은 외부 라이브러리를 모른다.
/// 직렬화 책임은 [SongDto]가 진다.
class Song {
  /// 고유 식별자
  final int trackId;

  /// 앨범 고유 식별자
  final int collectionId;

  /// 곡명
  final String trackName;

  /// 아티스트
  final String artistName;

  /// 앨범명
  final String collectionName;

  /// 앨범아트 (100x100)
  final String? artworkUrl100;

  /// 재생 시간(ms)
  final int trackTimeMillis;

  /// 앨범 내 트랙 순서
  final int? trackNumber;

  /// 즐겨찾기 여부 — 도메인 개념이며 DTO에는 존재하지 않는다.
  final bool isFavorite;

  const Song({
    required this.trackId,
    required this.collectionId,
    required this.trackName,
    required this.artistName,
    required this.collectionName,
    this.artworkUrl100,
    required this.trackTimeMillis,
    this.trackNumber,
    this.isFavorite = false,
  });

  Song copyWith({
    int? trackId,
    int? collectionId,
    String? trackName,
    String? artistName,
    String? collectionName,
    String? artworkUrl100,
    int? trackTimeMillis,
    int? trackNumber,
    bool? isFavorite,
  }) {
    return Song(
      trackId: trackId ?? this.trackId,
      collectionId: collectionId ?? this.collectionId,
      trackName: trackName ?? this.trackName,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
      trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
      trackNumber: trackNumber ?? this.trackNumber,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
