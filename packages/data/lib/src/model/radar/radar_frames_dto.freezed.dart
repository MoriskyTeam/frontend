// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radar_frames_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadarFramesDTO {

 List<RadarFrameDTO>? get past;
/// Create a copy of RadarFramesDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarFramesDTOCopyWith<RadarFramesDTO> get copyWith => _$RadarFramesDTOCopyWithImpl<RadarFramesDTO>(this as RadarFramesDTO, _$identity);

  /// Serializes this RadarFramesDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarFramesDTO&&const DeepCollectionEquality().equals(other.past, past));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(past));

@override
String toString() {
  return 'RadarFramesDTO(past: $past)';
}


}

/// @nodoc
abstract mixin class $RadarFramesDTOCopyWith<$Res>  {
  factory $RadarFramesDTOCopyWith(RadarFramesDTO value, $Res Function(RadarFramesDTO) _then) = _$RadarFramesDTOCopyWithImpl;
@useResult
$Res call({
 List<RadarFrameDTO>? past
});




}
/// @nodoc
class _$RadarFramesDTOCopyWithImpl<$Res>
    implements $RadarFramesDTOCopyWith<$Res> {
  _$RadarFramesDTOCopyWithImpl(this._self, this._then);

  final RadarFramesDTO _self;
  final $Res Function(RadarFramesDTO) _then;

/// Create a copy of RadarFramesDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? past = freezed,}) {
  return _then(_self.copyWith(
past: freezed == past ? _self.past : past // ignore: cast_nullable_to_non_nullable
as List<RadarFrameDTO>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadarFramesDTO].
extension RadarFramesDTOPatterns on RadarFramesDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadarFramesDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadarFramesDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadarFramesDTO value)  $default,){
final _that = this;
switch (_that) {
case _RadarFramesDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadarFramesDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RadarFramesDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RadarFrameDTO>? past)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadarFramesDTO() when $default != null:
return $default(_that.past);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RadarFrameDTO>? past)  $default,) {final _that = this;
switch (_that) {
case _RadarFramesDTO():
return $default(_that.past);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RadarFrameDTO>? past)?  $default,) {final _that = this;
switch (_that) {
case _RadarFramesDTO() when $default != null:
return $default(_that.past);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RadarFramesDTO implements RadarFramesDTO {
  const _RadarFramesDTO({required final  List<RadarFrameDTO>? past}): _past = past;
  factory _RadarFramesDTO.fromJson(Map<String, dynamic> json) => _$RadarFramesDTOFromJson(json);

 final  List<RadarFrameDTO>? _past;
@override List<RadarFrameDTO>? get past {
  final value = _past;
  if (value == null) return null;
  if (_past is EqualUnmodifiableListView) return _past;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RadarFramesDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadarFramesDTOCopyWith<_RadarFramesDTO> get copyWith => __$RadarFramesDTOCopyWithImpl<_RadarFramesDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadarFramesDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadarFramesDTO&&const DeepCollectionEquality().equals(other._past, _past));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_past));

@override
String toString() {
  return 'RadarFramesDTO(past: $past)';
}


}

/// @nodoc
abstract mixin class _$RadarFramesDTOCopyWith<$Res> implements $RadarFramesDTOCopyWith<$Res> {
  factory _$RadarFramesDTOCopyWith(_RadarFramesDTO value, $Res Function(_RadarFramesDTO) _then) = __$RadarFramesDTOCopyWithImpl;
@override @useResult
$Res call({
 List<RadarFrameDTO>? past
});




}
/// @nodoc
class __$RadarFramesDTOCopyWithImpl<$Res>
    implements _$RadarFramesDTOCopyWith<$Res> {
  __$RadarFramesDTOCopyWithImpl(this._self, this._then);

  final _RadarFramesDTO _self;
  final $Res Function(_RadarFramesDTO) _then;

/// Create a copy of RadarFramesDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? past = freezed,}) {
  return _then(_RadarFramesDTO(
past: freezed == past ? _self._past : past // ignore: cast_nullable_to_non_nullable
as List<RadarFrameDTO>?,
  ));
}


}

// dart format on
