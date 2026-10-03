// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radar_frame_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadarFrameDTO {

/// Unix seconds.
 int? get time; String? get path;
/// Create a copy of RadarFrameDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarFrameDTOCopyWith<RadarFrameDTO> get copyWith => _$RadarFrameDTOCopyWithImpl<RadarFrameDTO>(this as RadarFrameDTO, _$identity);

  /// Serializes this RadarFrameDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarFrameDTO&&(identical(other.time, time) || other.time == time)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,path);

@override
String toString() {
  return 'RadarFrameDTO(time: $time, path: $path)';
}


}

/// @nodoc
abstract mixin class $RadarFrameDTOCopyWith<$Res>  {
  factory $RadarFrameDTOCopyWith(RadarFrameDTO value, $Res Function(RadarFrameDTO) _then) = _$RadarFrameDTOCopyWithImpl;
@useResult
$Res call({
 int? time, String? path
});




}
/// @nodoc
class _$RadarFrameDTOCopyWithImpl<$Res>
    implements $RadarFrameDTOCopyWith<$Res> {
  _$RadarFrameDTOCopyWithImpl(this._self, this._then);

  final RadarFrameDTO _self;
  final $Res Function(RadarFrameDTO) _then;

/// Create a copy of RadarFrameDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? path = freezed,}) {
  return _then(_self.copyWith(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadarFrameDTO].
extension RadarFrameDTOPatterns on RadarFrameDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadarFrameDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadarFrameDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadarFrameDTO value)  $default,){
final _that = this;
switch (_that) {
case _RadarFrameDTO():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadarFrameDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RadarFrameDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? time,  String? path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadarFrameDTO() when $default != null:
return $default(_that.time,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? time,  String? path)  $default,) {final _that = this;
switch (_that) {
case _RadarFrameDTO():
return $default(_that.time,_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? time,  String? path)?  $default,) {final _that = this;
switch (_that) {
case _RadarFrameDTO() when $default != null:
return $default(_that.time,_that.path);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RadarFrameDTO implements RadarFrameDTO {
  const _RadarFrameDTO({required this.time, required this.path});
  factory _RadarFrameDTO.fromJson(Map<String, dynamic> json) => _$RadarFrameDTOFromJson(json);

/// Unix seconds.
@override final  int? time;
@override final  String? path;

/// Create a copy of RadarFrameDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadarFrameDTOCopyWith<_RadarFrameDTO> get copyWith => __$RadarFrameDTOCopyWithImpl<_RadarFrameDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadarFrameDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadarFrameDTO&&(identical(other.time, time) || other.time == time)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,path);

@override
String toString() {
  return 'RadarFrameDTO(time: $time, path: $path)';
}


}

/// @nodoc
abstract mixin class _$RadarFrameDTOCopyWith<$Res> implements $RadarFrameDTOCopyWith<$Res> {
  factory _$RadarFrameDTOCopyWith(_RadarFrameDTO value, $Res Function(_RadarFrameDTO) _then) = __$RadarFrameDTOCopyWithImpl;
@override @useResult
$Res call({
 int? time, String? path
});




}
/// @nodoc
class __$RadarFrameDTOCopyWithImpl<$Res>
    implements _$RadarFrameDTOCopyWith<$Res> {
  __$RadarFrameDTOCopyWithImpl(this._self, this._then);

  final _RadarFrameDTO _self;
  final $Res Function(_RadarFrameDTO) _then;

/// Create a copy of RadarFrameDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? path = freezed,}) {
  return _then(_RadarFrameDTO(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
