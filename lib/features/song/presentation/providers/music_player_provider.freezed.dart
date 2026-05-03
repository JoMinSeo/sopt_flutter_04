// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_player_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicPlayerState {

 bool get isPlaying; double get currentPosition; int? get currentSongId;
/// Create a copy of MusicPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicPlayerStateCopyWith<MusicPlayerState> get copyWith => _$MusicPlayerStateCopyWithImpl<MusicPlayerState>(this as MusicPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicPlayerState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.currentSongId, currentSongId) || other.currentSongId == currentSongId));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,currentPosition,currentSongId);

@override
String toString() {
  return 'MusicPlayerState(isPlaying: $isPlaying, currentPosition: $currentPosition, currentSongId: $currentSongId)';
}


}

/// @nodoc
abstract mixin class $MusicPlayerStateCopyWith<$Res>  {
  factory $MusicPlayerStateCopyWith(MusicPlayerState value, $Res Function(MusicPlayerState) _then) = _$MusicPlayerStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, double currentPosition, int? currentSongId
});




}
/// @nodoc
class _$MusicPlayerStateCopyWithImpl<$Res>
    implements $MusicPlayerStateCopyWith<$Res> {
  _$MusicPlayerStateCopyWithImpl(this._self, this._then);

  final MusicPlayerState _self;
  final $Res Function(MusicPlayerState) _then;

/// Create a copy of MusicPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? currentPosition = null,Object? currentSongId = freezed,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as double,currentSongId: freezed == currentSongId ? _self.currentSongId : currentSongId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicPlayerState].
extension MusicPlayerStatePatterns on MusicPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicPlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicPlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicPlayerState value)  $default,){
final _that = this;
switch (_that) {
case _MusicPlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicPlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _MusicPlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  double currentPosition,  int? currentSongId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicPlayerState() when $default != null:
return $default(_that.isPlaying,_that.currentPosition,_that.currentSongId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  double currentPosition,  int? currentSongId)  $default,) {final _that = this;
switch (_that) {
case _MusicPlayerState():
return $default(_that.isPlaying,_that.currentPosition,_that.currentSongId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  double currentPosition,  int? currentSongId)?  $default,) {final _that = this;
switch (_that) {
case _MusicPlayerState() when $default != null:
return $default(_that.isPlaying,_that.currentPosition,_that.currentSongId);case _:
  return null;

}
}

}

/// @nodoc


class _MusicPlayerState implements MusicPlayerState {
  const _MusicPlayerState({this.isPlaying = false, this.currentPosition = 0.0, this.currentSongId});
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  double currentPosition;
@override final  int? currentSongId;

/// Create a copy of MusicPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicPlayerStateCopyWith<_MusicPlayerState> get copyWith => __$MusicPlayerStateCopyWithImpl<_MusicPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicPlayerState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.currentSongId, currentSongId) || other.currentSongId == currentSongId));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,currentPosition,currentSongId);

@override
String toString() {
  return 'MusicPlayerState(isPlaying: $isPlaying, currentPosition: $currentPosition, currentSongId: $currentSongId)';
}


}

/// @nodoc
abstract mixin class _$MusicPlayerStateCopyWith<$Res> implements $MusicPlayerStateCopyWith<$Res> {
  factory _$MusicPlayerStateCopyWith(_MusicPlayerState value, $Res Function(_MusicPlayerState) _then) = __$MusicPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, double currentPosition, int? currentSongId
});




}
/// @nodoc
class __$MusicPlayerStateCopyWithImpl<$Res>
    implements _$MusicPlayerStateCopyWith<$Res> {
  __$MusicPlayerStateCopyWithImpl(this._self, this._then);

  final _MusicPlayerState _self;
  final $Res Function(_MusicPlayerState) _then;

/// Create a copy of MusicPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? currentPosition = null,Object? currentSongId = freezed,}) {
  return _then(_MusicPlayerState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as double,currentSongId: freezed == currentSongId ? _self.currentSongId : currentSongId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
