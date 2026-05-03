// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongDto {

 int get trackId; int get collectionId; String get trackName; String get artistName; String get collectionName; String? get artworkUrl100;@JsonKey(defaultValue: 0) int get trackTimeMillis; int? get trackNumber;
/// Create a copy of SongDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongDtoCopyWith<SongDto> get copyWith => _$SongDtoCopyWithImpl<SongDto>(this as SongDto, _$identity);

  /// Serializes this SongDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongDto&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.artworkUrl100, artworkUrl100) || other.artworkUrl100 == artworkUrl100)&&(identical(other.trackTimeMillis, trackTimeMillis) || other.trackTimeMillis == trackTimeMillis)&&(identical(other.trackNumber, trackNumber) || other.trackNumber == trackNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,collectionId,trackName,artistName,collectionName,artworkUrl100,trackTimeMillis,trackNumber);

@override
String toString() {
  return 'SongDto(trackId: $trackId, collectionId: $collectionId, trackName: $trackName, artistName: $artistName, collectionName: $collectionName, artworkUrl100: $artworkUrl100, trackTimeMillis: $trackTimeMillis, trackNumber: $trackNumber)';
}


}

/// @nodoc
abstract mixin class $SongDtoCopyWith<$Res>  {
  factory $SongDtoCopyWith(SongDto value, $Res Function(SongDto) _then) = _$SongDtoCopyWithImpl;
@useResult
$Res call({
 int trackId, int collectionId, String trackName, String artistName, String collectionName, String? artworkUrl100,@JsonKey(defaultValue: 0) int trackTimeMillis, int? trackNumber
});




}
/// @nodoc
class _$SongDtoCopyWithImpl<$Res>
    implements $SongDtoCopyWith<$Res> {
  _$SongDtoCopyWithImpl(this._self, this._then);

  final SongDto _self;
  final $Res Function(SongDto) _then;

/// Create a copy of SongDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? collectionId = null,Object? trackName = null,Object? artistName = null,Object? collectionName = null,Object? artworkUrl100 = freezed,Object? trackTimeMillis = null,Object? trackNumber = freezed,}) {
  return _then(_self.copyWith(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as int,collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,artworkUrl100: freezed == artworkUrl100 ? _self.artworkUrl100 : artworkUrl100 // ignore: cast_nullable_to_non_nullable
as String?,trackTimeMillis: null == trackTimeMillis ? _self.trackTimeMillis : trackTimeMillis // ignore: cast_nullable_to_non_nullable
as int,trackNumber: freezed == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SongDto].
extension SongDtoPatterns on SongDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongDto value)  $default,){
final _that = this;
switch (_that) {
case _SongDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongDto value)?  $default,){
final _that = this;
switch (_that) {
case _SongDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int trackId,  int collectionId,  String trackName,  String artistName,  String collectionName,  String? artworkUrl100, @JsonKey(defaultValue: 0)  int trackTimeMillis,  int? trackNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongDto() when $default != null:
return $default(_that.trackId,_that.collectionId,_that.trackName,_that.artistName,_that.collectionName,_that.artworkUrl100,_that.trackTimeMillis,_that.trackNumber);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int trackId,  int collectionId,  String trackName,  String artistName,  String collectionName,  String? artworkUrl100, @JsonKey(defaultValue: 0)  int trackTimeMillis,  int? trackNumber)  $default,) {final _that = this;
switch (_that) {
case _SongDto():
return $default(_that.trackId,_that.collectionId,_that.trackName,_that.artistName,_that.collectionName,_that.artworkUrl100,_that.trackTimeMillis,_that.trackNumber);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int trackId,  int collectionId,  String trackName,  String artistName,  String collectionName,  String? artworkUrl100, @JsonKey(defaultValue: 0)  int trackTimeMillis,  int? trackNumber)?  $default,) {final _that = this;
switch (_that) {
case _SongDto() when $default != null:
return $default(_that.trackId,_that.collectionId,_that.trackName,_that.artistName,_that.collectionName,_that.artworkUrl100,_that.trackTimeMillis,_that.trackNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongDto extends SongDto {
  const _SongDto({required this.trackId, required this.collectionId, required this.trackName, required this.artistName, required this.collectionName, this.artworkUrl100, @JsonKey(defaultValue: 0) required this.trackTimeMillis, this.trackNumber}): super._();
  factory _SongDto.fromJson(Map<String, dynamic> json) => _$SongDtoFromJson(json);

@override final  int trackId;
@override final  int collectionId;
@override final  String trackName;
@override final  String artistName;
@override final  String collectionName;
@override final  String? artworkUrl100;
@override@JsonKey(defaultValue: 0) final  int trackTimeMillis;
@override final  int? trackNumber;

/// Create a copy of SongDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongDtoCopyWith<_SongDto> get copyWith => __$SongDtoCopyWithImpl<_SongDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongDto&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.artworkUrl100, artworkUrl100) || other.artworkUrl100 == artworkUrl100)&&(identical(other.trackTimeMillis, trackTimeMillis) || other.trackTimeMillis == trackTimeMillis)&&(identical(other.trackNumber, trackNumber) || other.trackNumber == trackNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,collectionId,trackName,artistName,collectionName,artworkUrl100,trackTimeMillis,trackNumber);

@override
String toString() {
  return 'SongDto(trackId: $trackId, collectionId: $collectionId, trackName: $trackName, artistName: $artistName, collectionName: $collectionName, artworkUrl100: $artworkUrl100, trackTimeMillis: $trackTimeMillis, trackNumber: $trackNumber)';
}


}

/// @nodoc
abstract mixin class _$SongDtoCopyWith<$Res> implements $SongDtoCopyWith<$Res> {
  factory _$SongDtoCopyWith(_SongDto value, $Res Function(_SongDto) _then) = __$SongDtoCopyWithImpl;
@override @useResult
$Res call({
 int trackId, int collectionId, String trackName, String artistName, String collectionName, String? artworkUrl100,@JsonKey(defaultValue: 0) int trackTimeMillis, int? trackNumber
});




}
/// @nodoc
class __$SongDtoCopyWithImpl<$Res>
    implements _$SongDtoCopyWith<$Res> {
  __$SongDtoCopyWithImpl(this._self, this._then);

  final _SongDto _self;
  final $Res Function(_SongDto) _then;

/// Create a copy of SongDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? collectionId = null,Object? trackName = null,Object? artistName = null,Object? collectionName = null,Object? artworkUrl100 = freezed,Object? trackTimeMillis = null,Object? trackNumber = freezed,}) {
  return _then(_SongDto(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as int,collectionId: null == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,artworkUrl100: freezed == artworkUrl100 ? _self.artworkUrl100 : artworkUrl100 // ignore: cast_nullable_to_non_nullable
as String?,trackTimeMillis: null == trackTimeMillis ? _self.trackTimeMillis : trackTimeMillis // ignore: cast_nullable_to_non_nullable
as int,trackNumber: freezed == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
