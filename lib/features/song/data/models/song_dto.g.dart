// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongDto _$SongDtoFromJson(Map<String, dynamic> json) => _SongDto(
  trackId: (json['trackId'] as num).toInt(),
  collectionId: (json['collectionId'] as num).toInt(),
  trackName: json['trackName'] as String,
  artistName: json['artistName'] as String,
  collectionName: json['collectionName'] as String,
  artworkUrl100: json['artworkUrl100'] as String?,
  trackTimeMillis: (json['trackTimeMillis'] as num?)?.toInt() ?? 0,
  trackNumber: (json['trackNumber'] as num?)?.toInt(),
);

Map<String, dynamic> _$SongDtoToJson(_SongDto instance) => <String, dynamic>{
  'trackId': instance.trackId,
  'collectionId': instance.collectionId,
  'trackName': instance.trackName,
  'artistName': instance.artistName,
  'collectionName': instance.collectionName,
  'artworkUrl100': instance.artworkUrl100,
  'trackTimeMillis': instance.trackTimeMillis,
  'trackNumber': instance.trackNumber,
};
