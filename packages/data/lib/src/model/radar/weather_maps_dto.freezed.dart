// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_maps_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherMapsDTO {

 String? get host; RadarFramesDTO? get radar;
/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherMapsDTOCopyWith<WeatherMapsDTO> get copyWith => _$WeatherMapsDTOCopyWithImpl<WeatherMapsDTO>(this as WeatherMapsDTO, _$identity);

  /// Serializes this WeatherMapsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherMapsDTO&&(identical(other.host, host) || other.host == host)&&(identical(other.radar, radar) || other.radar == radar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,radar);

@override
String toString() {
  return 'WeatherMapsDTO(host: $host, radar: $radar)';
}


}

/// @nodoc
abstract mixin class $WeatherMapsDTOCopyWith<$Res>  {
  factory $WeatherMapsDTOCopyWith(WeatherMapsDTO value, $Res Function(WeatherMapsDTO) _then) = _$WeatherMapsDTOCopyWithImpl;
@useResult
$Res call({
 String? host, RadarFramesDTO? radar
});


$RadarFramesDTOCopyWith<$Res>? get radar;

}
/// @nodoc
class _$WeatherMapsDTOCopyWithImpl<$Res>
    implements $WeatherMapsDTOCopyWith<$Res> {
  _$WeatherMapsDTOCopyWithImpl(this._self, this._then);

  final WeatherMapsDTO _self;
  final $Res Function(WeatherMapsDTO) _then;

/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = freezed,Object? radar = freezed,}) {
  return _then(_self.copyWith(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,radar: freezed == radar ? _self.radar : radar // ignore: cast_nullable_to_non_nullable
as RadarFramesDTO?,
  ));
}
/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadarFramesDTOCopyWith<$Res>? get radar {
    if (_self.radar == null) {
    return null;
  }

  return $RadarFramesDTOCopyWith<$Res>(_self.radar!, (value) {
    return _then(_self.copyWith(radar: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherMapsDTO].
extension WeatherMapsDTOPatterns on WeatherMapsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherMapsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherMapsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherMapsDTO value)  $default,){
final _that = this;
switch (_that) {
case _WeatherMapsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherMapsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherMapsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? host,  RadarFramesDTO? radar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherMapsDTO() when $default != null:
return $default(_that.host,_that.radar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? host,  RadarFramesDTO? radar)  $default,) {final _that = this;
switch (_that) {
case _WeatherMapsDTO():
return $default(_that.host,_that.radar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? host,  RadarFramesDTO? radar)?  $default,) {final _that = this;
switch (_that) {
case _WeatherMapsDTO() when $default != null:
return $default(_that.host,_that.radar);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _WeatherMapsDTO implements WeatherMapsDTO {
  const _WeatherMapsDTO({required this.host, required this.radar});
  factory _WeatherMapsDTO.fromJson(Map<String, dynamic> json) => _$WeatherMapsDTOFromJson(json);

@override final  String? host;
@override final  RadarFramesDTO? radar;

/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherMapsDTOCopyWith<_WeatherMapsDTO> get copyWith => __$WeatherMapsDTOCopyWithImpl<_WeatherMapsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherMapsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherMapsDTO&&(identical(other.host, host) || other.host == host)&&(identical(other.radar, radar) || other.radar == radar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,radar);

@override
String toString() {
  return 'WeatherMapsDTO(host: $host, radar: $radar)';
}


}

/// @nodoc
abstract mixin class _$WeatherMapsDTOCopyWith<$Res> implements $WeatherMapsDTOCopyWith<$Res> {
  factory _$WeatherMapsDTOCopyWith(_WeatherMapsDTO value, $Res Function(_WeatherMapsDTO) _then) = __$WeatherMapsDTOCopyWithImpl;
@override @useResult
$Res call({
 String? host, RadarFramesDTO? radar
});


@override $RadarFramesDTOCopyWith<$Res>? get radar;

}
/// @nodoc
class __$WeatherMapsDTOCopyWithImpl<$Res>
    implements _$WeatherMapsDTOCopyWith<$Res> {
  __$WeatherMapsDTOCopyWithImpl(this._self, this._then);

  final _WeatherMapsDTO _self;
  final $Res Function(_WeatherMapsDTO) _then;

/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = freezed,Object? radar = freezed,}) {
  return _then(_WeatherMapsDTO(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,radar: freezed == radar ? _self.radar : radar // ignore: cast_nullable_to_non_nullable
as RadarFramesDTO?,
  ));
}

/// Create a copy of WeatherMapsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadarFramesDTOCopyWith<$Res>? get radar {
    if (_self.radar == null) {
    return null;
  }

  return $RadarFramesDTOCopyWith<$Res>(_self.radar!, (value) {
    return _then(_self.copyWith(radar: value));
  });
}
}

// dart format on
