import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
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
  @JsonKey(defaultValue: 0)
  final int trackTimeMillis;

  /// 앨범 내 트랙 순서
  final int? trackNumber;

  @JsonKey(defaultValue: false)
  final bool isFavorite;

  Song({
    required this.trackId,
    required this.collectionId,
    required this.trackName,
    required this.artistName,
    required this.collectionName,
    this.artworkUrl100,
    required this.trackTimeMillis,
    this.trackNumber,
    required this.isFavorite,
  });

  /// JSON -> [Song] 변환
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  /// [Song] -> JSON 변환
  Map<String, dynamic> toJson() => _$SongToJson(this);

  /// [Song] 복사
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
