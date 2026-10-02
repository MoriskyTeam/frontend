// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirReading {

 AirQualityLevel get level; double? get pm25; double? get pm10;
/// Create a copy of AirReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirReadingCopyWith<AirReading> get copyWith => _$AirReadingCopyWithImpl<AirReading>(this as AirReading, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirReading&&(identical(other.level, level) || other.level == level)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10));
}


@override
int get hashCode => Object.hash(runtimeType,level,pm25,pm10);

@override
String toString() {
  return 'AirReading(level: $level, pm25: $pm25, pm10: $pm10)';
}


}

/// @nodoc
abstract mixin class $AirReadingCopyWith<$Res>  {
  factory $AirReadingCopyWith(AirReading value, $Res Function(AirReading) _then) = _$AirReadingCopyWithImpl;
@useResult
$Res call({
 AirQualityLevel level, double? pm25, double? pm10
});




}
/// @nodoc
class _$AirReadingCopyWithImpl<$Res>
    implements $AirReadingCopyWith<$Res> {
  _$AirReadingCopyWithImpl(this._self, this._then);

  final AirReading _self;
  final $Res Function(AirReading) _then;

/// Create a copy of AirReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? pm25 = freezed,Object? pm10 = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as AirQualityLevel,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirReading].
extension AirReadingPatterns on AirReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirReading value)  $default,){
final _that = this;
switch (_that) {
case _AirReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirReading value)?  $default,){
final _that = this;
switch (_that) {
case _AirReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AirQualityLevel level,  double? pm25,  double? pm10)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirReading() when $default != null:
return $default(_that.level,_that.pm25,_that.pm10);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AirQualityLevel level,  double? pm25,  double? pm10)  $default,) {final _that = this;
switch (_that) {
case _AirReading():
return $default(_that.level,_that.pm25,_that.pm10);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AirQualityLevel level,  double? pm25,  double? pm10)?  $default,) {final _that = this;
switch (_that) {
case _AirReading() when $default != null:
return $default(_that.level,_that.pm25,_that.pm10);case _:
  return null;

}
}

}

/// @nodoc


class _AirReading implements AirReading {
  const _AirReading({required this.level, required this.pm25, required this.pm10});
  

@override final  AirQualityLevel level;
@override final  double? pm25;
@override final  double? pm10;

/// Create a copy of AirReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirReadingCopyWith<_AirReading> get copyWith => __$AirReadingCopyWithImpl<_AirReading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirReading&&(identical(other.level, level) || other.level == level)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10));
}


@override
int get hashCode => Object.hash(runtimeType,level,pm25,pm10);

@override
String toString() {
  return 'AirReading(level: $level, pm25: $pm25, pm10: $pm10)';
}


}

/// @nodoc
abstract mixin class _$AirReadingCopyWith<$Res> implements $AirReadingCopyWith<$Res> {
  factory _$AirReadingCopyWith(_AirReading value, $Res Function(_AirReading) _then) = __$AirReadingCopyWithImpl;
@override @useResult
$Res call({
 AirQualityLevel level, double? pm25, double? pm10
});




}
/// @nodoc
class __$AirReadingCopyWithImpl<$Res>
    implements _$AirReadingCopyWith<$Res> {
  __$AirReadingCopyWithImpl(this._self, this._then);

  final _AirReading _self;
  final $Res Function(_AirReading) _then;

/// Create a copy of AirReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? pm25 = freezed,Object? pm10 = freezed,}) {
  return _then(_AirReading(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as AirQualityLevel,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
