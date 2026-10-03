// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gios_station_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiosStationDTO {

 int? get stationId; String? get code; String? get name; String? get city; String? get street; double? get lat; double? get lng; int? get pm25SensorId; int? get pm10SensorId;
/// Create a copy of GiosStationDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiosStationDTOCopyWith<GiosStationDTO> get copyWith => _$GiosStationDTOCopyWithImpl<GiosStationDTO>(this as GiosStationDTO, _$identity);

  /// Serializes this GiosStationDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiosStationDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.street, street) || other.street == street)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.pm25SensorId, pm25SensorId) || other.pm25SensorId == pm25SensorId)&&(identical(other.pm10SensorId, pm10SensorId) || other.pm10SensorId == pm10SensorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,code,name,city,street,lat,lng,pm25SensorId,pm10SensorId);

@override
String toString() {
  return 'GiosStationDTO(stationId: $stationId, code: $code, name: $name, city: $city, street: $street, lat: $lat, lng: $lng, pm25SensorId: $pm25SensorId, pm10SensorId: $pm10SensorId)';
}


}

/// @nodoc
abstract mixin class $GiosStationDTOCopyWith<$Res>  {
  factory $GiosStationDTOCopyWith(GiosStationDTO value, $Res Function(GiosStationDTO) _then) = _$GiosStationDTOCopyWithImpl;
@useResult
$Res call({
 int? stationId, String? code, String? name, String? city, String? street, double? lat, double? lng, int? pm25SensorId, int? pm10SensorId
});




}
/// @nodoc
class _$GiosStationDTOCopyWithImpl<$Res>
    implements $GiosStationDTOCopyWith<$Res> {
  _$GiosStationDTOCopyWithImpl(this._self, this._then);

  final GiosStationDTO _self;
  final $Res Function(GiosStationDTO) _then;

/// Create a copy of GiosStationDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationId = freezed,Object? code = freezed,Object? name = freezed,Object? city = freezed,Object? street = freezed,Object? lat = freezed,Object? lng = freezed,Object? pm25SensorId = freezed,Object? pm10SensorId = freezed,}) {
  return _then(_self.copyWith(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,pm25SensorId: freezed == pm25SensorId ? _self.pm25SensorId : pm25SensorId // ignore: cast_nullable_to_non_nullable
as int?,pm10SensorId: freezed == pm10SensorId ? _self.pm10SensorId : pm10SensorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiosStationDTO].
extension GiosStationDTOPatterns on GiosStationDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiosStationDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiosStationDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiosStationDTO value)  $default,){
final _that = this;
switch (_that) {
case _GiosStationDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiosStationDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GiosStationDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? stationId,  String? code,  String? name,  String? city,  String? street,  double? lat,  double? lng,  int? pm25SensorId,  int? pm10SensorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiosStationDTO() when $default != null:
return $default(_that.stationId,_that.code,_that.name,_that.city,_that.street,_that.lat,_that.lng,_that.pm25SensorId,_that.pm10SensorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? stationId,  String? code,  String? name,  String? city,  String? street,  double? lat,  double? lng,  int? pm25SensorId,  int? pm10SensorId)  $default,) {final _that = this;
switch (_that) {
case _GiosStationDTO():
return $default(_that.stationId,_that.code,_that.name,_that.city,_that.street,_that.lat,_that.lng,_that.pm25SensorId,_that.pm10SensorId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? stationId,  String? code,  String? name,  String? city,  String? street,  double? lat,  double? lng,  int? pm25SensorId,  int? pm10SensorId)?  $default,) {final _that = this;
switch (_that) {
case _GiosStationDTO() when $default != null:
return $default(_that.stationId,_that.code,_that.name,_that.city,_that.street,_that.lat,_that.lng,_that.pm25SensorId,_that.pm10SensorId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GiosStationDTO implements GiosStationDTO {
  const _GiosStationDTO({required this.stationId, required this.code, required this.name, required this.city, required this.street, required this.lat, required this.lng, required this.pm25SensorId, required this.pm10SensorId});
  factory _GiosStationDTO.fromJson(Map<String, dynamic> json) => _$GiosStationDTOFromJson(json);

@override final  int? stationId;
@override final  String? code;
@override final  String? name;
@override final  String? city;
@override final  String? street;
@override final  double? lat;
@override final  double? lng;
@override final  int? pm25SensorId;
@override final  int? pm10SensorId;

/// Create a copy of GiosStationDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiosStationDTOCopyWith<_GiosStationDTO> get copyWith => __$GiosStationDTOCopyWithImpl<_GiosStationDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiosStationDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiosStationDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.street, street) || other.street == street)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.pm25SensorId, pm25SensorId) || other.pm25SensorId == pm25SensorId)&&(identical(other.pm10SensorId, pm10SensorId) || other.pm10SensorId == pm10SensorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,code,name,city,street,lat,lng,pm25SensorId,pm10SensorId);

@override
String toString() {
  return 'GiosStationDTO(stationId: $stationId, code: $code, name: $name, city: $city, street: $street, lat: $lat, lng: $lng, pm25SensorId: $pm25SensorId, pm10SensorId: $pm10SensorId)';
}


}

/// @nodoc
abstract mixin class _$GiosStationDTOCopyWith<$Res> implements $GiosStationDTOCopyWith<$Res> {
  factory _$GiosStationDTOCopyWith(_GiosStationDTO value, $Res Function(_GiosStationDTO) _then) = __$GiosStationDTOCopyWithImpl;
@override @useResult
$Res call({
 int? stationId, String? code, String? name, String? city, String? street, double? lat, double? lng, int? pm25SensorId, int? pm10SensorId
});




}
/// @nodoc
class __$GiosStationDTOCopyWithImpl<$Res>
    implements _$GiosStationDTOCopyWith<$Res> {
  __$GiosStationDTOCopyWithImpl(this._self, this._then);

  final _GiosStationDTO _self;
  final $Res Function(_GiosStationDTO) _then;

/// Create a copy of GiosStationDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationId = freezed,Object? code = freezed,Object? name = freezed,Object? city = freezed,Object? street = freezed,Object? lat = freezed,Object? lng = freezed,Object? pm25SensorId = freezed,Object? pm10SensorId = freezed,}) {
  return _then(_GiosStationDTO(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,pm25SensorId: freezed == pm25SensorId ? _self.pm25SensorId : pm25SensorId // ignore: cast_nullable_to_non_nullable
as int?,pm10SensorId: freezed == pm10SensorId ? _self.pm10SensorId : pm10SensorId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
