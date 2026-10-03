// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'synop_reading_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynopReadingDTO {

 int? get stationId; double? get temperature; double? get windSpeed; int? get windDirection; double? get humidity; double? get precipitation; double? get pressure; DateTime? get measuredAt; DateTime? get updatedAt;
/// Create a copy of SynopReadingDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynopReadingDTOCopyWith<SynopReadingDTO> get copyWith => _$SynopReadingDTOCopyWithImpl<SynopReadingDTO>(this as SynopReadingDTO, _$identity);

  /// Serializes this SynopReadingDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynopReadingDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,temperature,windSpeed,windDirection,humidity,precipitation,pressure,measuredAt,updatedAt);

@override
String toString() {
  return 'SynopReadingDTO(stationId: $stationId, temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, humidity: $humidity, precipitation: $precipitation, pressure: $pressure, measuredAt: $measuredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SynopReadingDTOCopyWith<$Res>  {
  factory $SynopReadingDTOCopyWith(SynopReadingDTO value, $Res Function(SynopReadingDTO) _then) = _$SynopReadingDTOCopyWithImpl;
@useResult
$Res call({
 int? stationId, double? temperature, double? windSpeed, int? windDirection, double? humidity, double? precipitation, double? pressure, DateTime? measuredAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SynopReadingDTOCopyWithImpl<$Res>
    implements $SynopReadingDTOCopyWith<$Res> {
  _$SynopReadingDTOCopyWithImpl(this._self, this._then);

  final SynopReadingDTO _self;
  final $Res Function(SynopReadingDTO) _then;

/// Create a copy of SynopReadingDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationId = freezed,Object? temperature = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? humidity = freezed,Object? precipitation = freezed,Object? pressure = freezed,Object? measuredAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,measuredAt: freezed == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SynopReadingDTO].
extension SynopReadingDTOPatterns on SynopReadingDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SynopReadingDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SynopReadingDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SynopReadingDTO value)  $default,){
final _that = this;
switch (_that) {
case _SynopReadingDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SynopReadingDTO value)?  $default,){
final _that = this;
switch (_that) {
case _SynopReadingDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? stationId,  double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure,  DateTime? measuredAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SynopReadingDTO() when $default != null:
return $default(_that.stationId,_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure,_that.measuredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? stationId,  double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure,  DateTime? measuredAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SynopReadingDTO():
return $default(_that.stationId,_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure,_that.measuredAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? stationId,  double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure,  DateTime? measuredAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SynopReadingDTO() when $default != null:
return $default(_that.stationId,_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure,_that.measuredAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SynopReadingDTO implements SynopReadingDTO {
  const _SynopReadingDTO({required this.stationId, required this.temperature, required this.windSpeed, required this.windDirection, required this.humidity, required this.precipitation, required this.pressure, required this.measuredAt, required this.updatedAt});
  factory _SynopReadingDTO.fromJson(Map<String, dynamic> json) => _$SynopReadingDTOFromJson(json);

@override final  int? stationId;
@override final  double? temperature;
@override final  double? windSpeed;
@override final  int? windDirection;
@override final  double? humidity;
@override final  double? precipitation;
@override final  double? pressure;
@override final  DateTime? measuredAt;
@override final  DateTime? updatedAt;

/// Create a copy of SynopReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynopReadingDTOCopyWith<_SynopReadingDTO> get copyWith => __$SynopReadingDTOCopyWithImpl<_SynopReadingDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynopReadingDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynopReadingDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,temperature,windSpeed,windDirection,humidity,precipitation,pressure,measuredAt,updatedAt);

@override
String toString() {
  return 'SynopReadingDTO(stationId: $stationId, temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, humidity: $humidity, precipitation: $precipitation, pressure: $pressure, measuredAt: $measuredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SynopReadingDTOCopyWith<$Res> implements $SynopReadingDTOCopyWith<$Res> {
  factory _$SynopReadingDTOCopyWith(_SynopReadingDTO value, $Res Function(_SynopReadingDTO) _then) = __$SynopReadingDTOCopyWithImpl;
@override @useResult
$Res call({
 int? stationId, double? temperature, double? windSpeed, int? windDirection, double? humidity, double? precipitation, double? pressure, DateTime? measuredAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SynopReadingDTOCopyWithImpl<$Res>
    implements _$SynopReadingDTOCopyWith<$Res> {
  __$SynopReadingDTOCopyWithImpl(this._self, this._then);

  final _SynopReadingDTO _self;
  final $Res Function(_SynopReadingDTO) _then;

/// Create a copy of SynopReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationId = freezed,Object? temperature = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? humidity = freezed,Object? precipitation = freezed,Object? pressure = freezed,Object? measuredAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SynopReadingDTO(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,measuredAt: freezed == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
