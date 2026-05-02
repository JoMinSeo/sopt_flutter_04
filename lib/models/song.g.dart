// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
  trackId: (json['trackId'] as num).toInt(),
  collectionId: (json['collectionId'] as num).toInt(),
  trackName: json['trackName'] as String,
  artistName: json['artistName'] as String,
  collectionName: json['collectionName'] as String,
  artworkUrl100: json['artworkUrl100'] as String?,
  trackTimeMillis: (json['trackTimeMillis'] as num?)?.toInt() ?? 0,
  trackNumber: (json['trackNumber'] as num?)?.toInt(),
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
  'trackId': instance.trackId,
  'collectionId': instance.collectionId,
  'trackName': instance.trackName,
  'artistName': instance.artistName,
  'collectionName': instance.collectionName,
  'artworkUrl100': instance.artworkUrl100,
  'trackTimeMillis': instance.trackTimeMillis,
  'trackNumber': instance.trackNumber,
  'isFavorite': instance.isFavorite,
};
