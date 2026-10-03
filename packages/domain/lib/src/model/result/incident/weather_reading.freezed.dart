// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherReading {

/// °C.
 double? get temperature;/// m/s.
 double? get windSpeed;/// Degrees the wind blows from, 0 = north; null or 0 at calm.
 int? get windDirection;/// %.
 double? get humidity;/// mm.
 double? get precipitation;/// hPa.
 double? get pressure;
/// Create a copy of WeatherReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherReadingCopyWith<WeatherReading> get copyWith => _$WeatherReadingCopyWithImpl<WeatherReading>(this as WeatherReading, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherReading&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,windDirection,humidity,precipitation,pressure);

@override
String toString() {
  return 'WeatherReading(temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, humidity: $humidity, precipitation: $precipitation, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class $WeatherReadingCopyWith<$Res>  {
  factory $WeatherReadingCopyWith(WeatherReading value, $Res Function(WeatherReading) _then) = _$WeatherReadingCopyWithImpl;
@useResult
$Res call({
 double? temperature, double? windSpeed, int? windDirection, double? humidity, double? precipitation, double? pressure
});




}
/// @nodoc
class _$WeatherReadingCopyWithImpl<$Res>
    implements $WeatherReadingCopyWith<$Res> {
  _$WeatherReadingCopyWithImpl(this._self, this._then);

  final WeatherReading _self;
  final $Res Function(WeatherReading) _then;

/// Create a copy of WeatherReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? humidity = freezed,Object? precipitation = freezed,Object? pressure = freezed,}) {
  return _then(_self.copyWith(
temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherReading].
extension WeatherReadingPatterns on WeatherReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherReading value)  $default,){
final _that = this;
switch (_that) {
case _WeatherReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherReading value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherReading() when $default != null:
return $default(_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure)  $default,) {final _that = this;
switch (_that) {
case _WeatherReading():
return $default(_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? temperature,  double? windSpeed,  int? windDirection,  double? humidity,  double? precipitation,  double? pressure)?  $default,) {final _that = this;
switch (_that) {
case _WeatherReading() when $default != null:
return $default(_that.temperature,_that.windSpeed,_that.windDirection,_that.humidity,_that.precipitation,_that.pressure);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherReading implements WeatherReading {
  const _WeatherReading({required this.temperature, required this.windSpeed, required this.windDirection, required this.humidity, required this.precipitation, required this.pressure});
  

/// °C.
@override final  double? temperature;
/// m/s.
@override final  double? windSpeed;
/// Degrees the wind blows from, 0 = north; null or 0 at calm.
@override final  int? windDirection;
/// %.
@override final  double? humidity;
/// mm.
@override final  double? precipitation;
/// hPa.
@override final  double? pressure;

/// Create a copy of WeatherReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherReadingCopyWith<_WeatherReading> get copyWith => __$WeatherReadingCopyWithImpl<_WeatherReading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherReading&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,windDirection,humidity,precipitation,pressure);

@override
String toString() {
  return 'WeatherReading(temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, humidity: $humidity, precipitation: $precipitation, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class _$WeatherReadingCopyWith<$Res> implements $WeatherReadingCopyWith<$Res> {
  factory _$WeatherReadingCopyWith(_WeatherReading value, $Res Function(_WeatherReading) _then) = __$WeatherReadingCopyWithImpl;
@override @useResult
$Res call({
 double? temperature, double? windSpeed, int? windDirection, double? humidity, double? precipitation, double? pressure
});




}
/// @nodoc
class __$WeatherReadingCopyWithImpl<$Res>
    implements _$WeatherReadingCopyWith<$Res> {
  __$WeatherReadingCopyWithImpl(this._self, this._then);

  final _WeatherReading _self;
  final $Res Function(_WeatherReading) _then;

/// Create a copy of WeatherReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? humidity = freezed,Object? precipitation = freezed,Object? pressure = freezed,}) {
  return _then(_WeatherReading(
temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
