// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDto _$SongDtoFromJson(Map<String, dynamic> json) => SongDto(
  trackId: (json['trackId'] as num).toInt(),
  collectionId: (json['collectionId'] as num).toInt(),
  trackName: json['trackName'] as String,
  artistName: json['artistName'] as String,
  collectionName: json['collectionName'] as String,
  artworkUrl100: json['artworkUrl100'] as String?,
  trackTimeMillis: (json['trackTimeMillis'] as num?)?.toInt() ?? 0,
  trackNumber: (json['trackNumber'] as num?)?.toInt(),
);
