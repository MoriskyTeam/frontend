// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gios_reading_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiosReadingDTO {

 int? get sensorId; int? get stationId; String? get pollutant; double? get value; DateTime? get measuredAt; DateTime? get updatedAt;
/// Create a copy of GiosReadingDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiosReadingDTOCopyWith<GiosReadingDTO> get copyWith => _$GiosReadingDTOCopyWithImpl<GiosReadingDTO>(this as GiosReadingDTO, _$identity);

  /// Serializes this GiosReadingDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiosReadingDTO&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.pollutant, pollutant) || other.pollutant == pollutant)&&(identical(other.value, value) || other.value == value)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,stationId,pollutant,value,measuredAt,updatedAt);

@override
String toString() {
  return 'GiosReadingDTO(sensorId: $sensorId, stationId: $stationId, pollutant: $pollutant, value: $value, measuredAt: $measuredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GiosReadingDTOCopyWith<$Res>  {
  factory $GiosReadingDTOCopyWith(GiosReadingDTO value, $Res Function(GiosReadingDTO) _then) = _$GiosReadingDTOCopyWithImpl;
@useResult
$Res call({
 int? sensorId, int? stationId, String? pollutant, double? value, DateTime? measuredAt, DateTime? updatedAt
});




}
/// @nodoc
class _$GiosReadingDTOCopyWithImpl<$Res>
    implements $GiosReadingDTOCopyWith<$Res> {
  _$GiosReadingDTOCopyWithImpl(this._self, this._then);

  final GiosReadingDTO _self;
  final $Res Function(GiosReadingDTO) _then;

/// Create a copy of GiosReadingDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorId = freezed,Object? stationId = freezed,Object? pollutant = freezed,Object? value = freezed,Object? measuredAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
sensorId: freezed == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int?,stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,pollutant: freezed == pollutant ? _self.pollutant : pollutant // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,measuredAt: freezed == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiosReadingDTO].
extension GiosReadingDTOPatterns on GiosReadingDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiosReadingDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiosReadingDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiosReadingDTO value)  $default,){
final _that = this;
switch (_that) {
case _GiosReadingDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiosReadingDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GiosReadingDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sensorId,  int? stationId,  String? pollutant,  double? value,  DateTime? measuredAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiosReadingDTO() when $default != null:
return $default(_that.sensorId,_that.stationId,_that.pollutant,_that.value,_that.measuredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sensorId,  int? stationId,  String? pollutant,  double? value,  DateTime? measuredAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GiosReadingDTO():
return $default(_that.sensorId,_that.stationId,_that.pollutant,_that.value,_that.measuredAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sensorId,  int? stationId,  String? pollutant,  double? value,  DateTime? measuredAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GiosReadingDTO() when $default != null:
return $default(_that.sensorId,_that.stationId,_that.pollutant,_that.value,_that.measuredAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GiosReadingDTO implements GiosReadingDTO {
  const _GiosReadingDTO({required this.sensorId, required this.stationId, required this.pollutant, required this.value, required this.measuredAt, required this.updatedAt});
  factory _GiosReadingDTO.fromJson(Map<String, dynamic> json) => _$GiosReadingDTOFromJson(json);

@override final  int? sensorId;
@override final  int? stationId;
@override final  String? pollutant;
@override final  double? value;
@override final  DateTime? measuredAt;
@override final  DateTime? updatedAt;

/// Create a copy of GiosReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiosReadingDTOCopyWith<_GiosReadingDTO> get copyWith => __$GiosReadingDTOCopyWithImpl<_GiosReadingDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiosReadingDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiosReadingDTO&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.pollutant, pollutant) || other.pollutant == pollutant)&&(identical(other.value, value) || other.value == value)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,stationId,pollutant,value,measuredAt,updatedAt);

@override
String toString() {
  return 'GiosReadingDTO(sensorId: $sensorId, stationId: $stationId, pollutant: $pollutant, value: $value, measuredAt: $measuredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GiosReadingDTOCopyWith<$Res> implements $GiosReadingDTOCopyWith<$Res> {
  factory _$GiosReadingDTOCopyWith(_GiosReadingDTO value, $Res Function(_GiosReadingDTO) _then) = __$GiosReadingDTOCopyWithImpl;
@override @useResult
$Res call({
 int? sensorId, int? stationId, String? pollutant, double? value, DateTime? measuredAt, DateTime? updatedAt
});




}
/// @nodoc
class __$GiosReadingDTOCopyWithImpl<$Res>
    implements _$GiosReadingDTOCopyWith<$Res> {
  __$GiosReadingDTOCopyWithImpl(this._self, this._then);

  final _GiosReadingDTO _self;
  final $Res Function(_GiosReadingDTO) _then;

/// Create a copy of GiosReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorId = freezed,Object? stationId = freezed,Object? pollutant = freezed,Object? value = freezed,Object? measuredAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_GiosReadingDTO(
sensorId: freezed == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int?,stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as int?,pollutant: freezed == pollutant ? _self.pollutant : pollutant // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,measuredAt: freezed == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
