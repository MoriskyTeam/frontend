// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'synop_station_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynopStationDTO {

 int? get stationId; String? get name; double? get lat; double? get lng;
/// Create a copy of SynopStationDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynopStationDTOCopyWith<SynopStationDTO> get copyWith => _$SynopStationDTOCopyWithImpl<SynopStationDTO>(this as SynopStationDTO, _$identity);

  /// Serializes this SynopStationDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynopStationDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,name,lat,lng);

@override
String toString() {
  return 'SynopStationDTO(stationId: $stationId, name: $name, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $SynopStationDTOCopyWith<$Res>  {
  factory $SynopStationDTOCopyWith(SynopStationDTO value, $Res Function(SynopStationDTO) _then) = _$SynopStationDTOCopyWithImpl;
@useResult
$Res call({
 int? stationId, String? name, double? lat, double? lng
});




}
/// @nodoc
class _$SynopStationDTOCopyWithImpl<$Res>
    implements $SynopStationDTOCopyWith<$Res> {
  _$SynopStationDTOCopyWithImpl(this._self, this._then);

  final SynopStationDTO _self;
  final $Res Function(SynopStationDTO) _then;

/// Create a copy of SynopStationDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stationId = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SynopStationDTO].
extension SynopStationDTOPatterns on SynopStationDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SynopStationDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SynopStationDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SynopStationDTO value)  $default,){
final _that = this;
switch (_that) {
case _SynopStationDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SynopStationDTO value)?  $default,){
final _that = this;
switch (_that) {
case _SynopStationDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? stationId,  String? name,  double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SynopStationDTO() when $default != null:
return $default(_that.stationId,_that.name,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? stationId,  String? name,  double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _SynopStationDTO():
return $default(_that.stationId,_that.name,_that.lat,_that.lng);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? stationId,  String? name,  double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _SynopStationDTO() when $default != null:
return $default(_that.stationId,_that.name,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SynopStationDTO implements SynopStationDTO {
  const _SynopStationDTO({required this.stationId, required this.name, required this.lat, required this.lng});
  factory _SynopStationDTO.fromJson(Map<String, dynamic> json) => _$SynopStationDTOFromJson(json);

@override final  int? stationId;
@override final  String? name;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of SynopStationDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynopStationDTOCopyWith<_SynopStationDTO> get copyWith => __$SynopStationDTOCopyWithImpl<_SynopStationDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynopStationDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynopStationDTO&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stationId,name,lat,lng);

@override
String toString() {
  return 'SynopStationDTO(stationId: $stationId, name: $name, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$SynopStationDTOCopyWith<$Res> implements $SynopStationDTOCopyWith<$Res> {
  factory _$SynopStationDTOCopyWith(_SynopStationDTO value, $Res Function(_SynopStationDTO) _then) = __$SynopStationDTOCopyWithImpl;
@override @useResult
$Res call({
 int? stationId, String? name, double? lat, double? lng
});




}
/// @nodoc
class __$SynopStationDTOCopyWithImpl<$Res>
    implements _$SynopStationDTOCopyWith<$Res> {
  __$SynopStationDTOCopyWithImpl(this._self, this._then);

  final _SynopStationDTO _self;
  final $Res Function(_SynopStationDTO) _then;

/// Create a copy of SynopStationDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stationId = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_SynopStationDTO(
stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
