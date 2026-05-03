import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sopt_flutter_04/features/song/domain/entities/song.dart';

part 'song_dto.freezed.dart';
part 'song_dto.g.dart';

/// iTunes API 응답에 1:1로 매핑되는 데이터 전송 객체.
///
/// 외부 의존(JSON 직렬화)은 여기서만 처리하고, 도메인 계층으로는
/// [toEntity]를 거쳐 [Song]만 흘려보낸다.
@freezed
abstract class SongDto with _$SongDto {
  const SongDto._();

  const factory SongDto({
    required int trackId,
    required int collectionId,
    required String trackName,
    required String artistName,
    required String collectionName,
    String? artworkUrl100,
    @JsonKey(defaultValue: 0) required int trackTimeMillis,
    int? trackNumber,
  }) = _SongDto;

  factory SongDto.fromJson(Map<String, dynamic> json) =>
      _$SongDtoFromJson(json);

  /// DTO → 도메인 엔티티 변환.
  /// 즐겨찾기 여부는 다른 데이터 소스에서 채워지므로 기본값(false) 유지.
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
