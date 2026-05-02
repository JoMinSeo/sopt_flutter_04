import 'package:json_annotation/json_annotation.dart';
import 'package:sopt_flutter_04/data/entity/song.dart';

part 'song_dto.g.dart';

/// iTunes API 응답에 1:1로 매핑되는 데이터 전송 객체.
///
/// 외부 의존(JSON 직렬화)은 여기서만 처리하고, 도메인 계층으로는
/// [toEntity]를 거쳐 [Song]만 흘려보낸다.
@JsonSerializable(createToJson: false)
class SongDto {
  final int trackId;
  final int collectionId;
  final String trackName;
  final String artistName;
  final String collectionName;
  final String? artworkUrl100;

  @JsonKey(defaultValue: 0)
  final int trackTimeMillis;

  final int? trackNumber;

  SongDto({
    required this.trackId,
    required this.collectionId,
    required this.trackName,
    required this.artistName,
    required this.collectionName,
    this.artworkUrl100,
    required this.trackTimeMillis,
    this.trackNumber,
  });

  factory SongDto.fromJson(Map<String, dynamic> json) =>
      _$SongDtoFromJson(json);

  /// DTO → 도메인 모델 변환.
  /// 즐겨찾기 여부는 다른 데이터 소스에서 채워지므로 기본값 false.
  Song toEntity() => Song(
    trackId: trackId,
    collectionId: collectionId,
    trackName: trackName,
    artistName: artistName,
    collectionName: collectionName,
    artworkUrl100: artworkUrl100,
    trackTimeMillis: trackTimeMillis,
    trackNumber: trackNumber,
  );
}
