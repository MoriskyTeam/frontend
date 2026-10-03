// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationDTO {

 double? get lat; double? get lng; bool? get isFallback;
/// Create a copy of LocationDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationDTOCopyWith<LocationDTO> get copyWith => _$LocationDTOCopyWithImpl<LocationDTO>(this as LocationDTO, _$identity);

  /// Serializes this LocationDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationDTO&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isFallback, isFallback) || other.isFallback == isFallback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,isFallback);

@override
String toString() {
  return 'LocationDTO(lat: $lat, lng: $lng, isFallback: $isFallback)';
}


}

/// @nodoc
abstract mixin class $LocationDTOCopyWith<$Res>  {
  factory $LocationDTOCopyWith(LocationDTO value, $Res Function(LocationDTO) _then) = _$LocationDTOCopyWithImpl;
@useResult
$Res call({
 double? lat, double? lng, bool? isFallback
});




}
/// @nodoc
class _$LocationDTOCopyWithImpl<$Res>
    implements $LocationDTOCopyWith<$Res> {
  _$LocationDTOCopyWithImpl(this._self, this._then);

  final LocationDTO _self;
  final $Res Function(LocationDTO) _then;

/// Create a copy of LocationDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,Object? isFallback = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isFallback: freezed == isFallback ? _self.isFallback : isFallback // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationDTO].
extension LocationDTOPatterns on LocationDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationDTO value)  $default,){
final _that = this;
switch (_that) {
case _LocationDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationDTO value)?  $default,){
final _that = this;
switch (_that) {
case _LocationDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? lat,  double? lng,  bool? isFallback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationDTO() when $default != null:
return $default(_that.lat,_that.lng,_that.isFallback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? lat,  double? lng,  bool? isFallback)  $default,) {final _that = this;
switch (_that) {
case _LocationDTO():
return $default(_that.lat,_that.lng,_that.isFallback);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? lat,  double? lng,  bool? isFallback)?  $default,) {final _that = this;
switch (_that) {
case _LocationDTO() when $default != null:
return $default(_that.lat,_that.lng,_that.isFallback);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _LocationDTO implements LocationDTO {
  const _LocationDTO({required this.lat, required this.lng, required this.isFallback});
  factory _LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);

@override final  double? lat;
@override final  double? lng;
@override final  bool? isFallback;

/// Create a copy of LocationDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationDTOCopyWith<_LocationDTO> get copyWith => __$LocationDTOCopyWithImpl<_LocationDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationDTO&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isFallback, isFallback) || other.isFallback == isFallback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,isFallback);

@override
String toString() {
  return 'LocationDTO(lat: $lat, lng: $lng, isFallback: $isFallback)';
}


}

/// @nodoc
abstract mixin class _$LocationDTOCopyWith<$Res> implements $LocationDTOCopyWith<$Res> {
  factory _$LocationDTOCopyWith(_LocationDTO value, $Res Function(_LocationDTO) _then) = __$LocationDTOCopyWithImpl;
@override @useResult
$Res call({
 double? lat, double? lng, bool? isFallback
});




}
/// @nodoc
class __$LocationDTOCopyWithImpl<$Res>
    implements _$LocationDTOCopyWith<$Res> {
  __$LocationDTOCopyWithImpl(this._self, this._then);

  final _LocationDTO _self;
  final $Res Function(_LocationDTO) _then;

/// Create a copy of LocationDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,Object? isFallback = freezed,}) {
  return _then(_LocationDTO(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,isFallback: freezed == isFallback ? _self.isFallback : isFallback // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
