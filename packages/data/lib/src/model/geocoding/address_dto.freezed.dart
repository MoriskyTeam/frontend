// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressDTO {

 String? get road; String? get pedestrian; String? get houseNumber; String? get neighbourhood; String? get quarter; String? get suburb; String? get cityDistrict;
/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<AddressDTO> get copyWith => _$AddressDTOCopyWithImpl<AddressDTO>(this as AddressDTO, _$identity);

  /// Serializes this AddressDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDTO&&(identical(other.road, road) || other.road == road)&&(identical(other.pedestrian, pedestrian) || other.pedestrian == pedestrian)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.neighbourhood, neighbourhood) || other.neighbourhood == neighbourhood)&&(identical(other.quarter, quarter) || other.quarter == quarter)&&(identical(other.suburb, suburb) || other.suburb == suburb)&&(identical(other.cityDistrict, cityDistrict) || other.cityDistrict == cityDistrict));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,road,pedestrian,houseNumber,neighbourhood,quarter,suburb,cityDistrict);

@override
String toString() {
  return 'AddressDTO(road: $road, pedestrian: $pedestrian, houseNumber: $houseNumber, neighbourhood: $neighbourhood, quarter: $quarter, suburb: $suburb, cityDistrict: $cityDistrict)';
}


}

/// @nodoc
abstract mixin class $AddressDTOCopyWith<$Res>  {
  factory $AddressDTOCopyWith(AddressDTO value, $Res Function(AddressDTO) _then) = _$AddressDTOCopyWithImpl;
@useResult
$Res call({
 String? road, String? pedestrian, String? houseNumber, String? neighbourhood, String? quarter, String? suburb, String? cityDistrict
});




}
/// @nodoc
class _$AddressDTOCopyWithImpl<$Res>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._self, this._then);

  final AddressDTO _self;
  final $Res Function(AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? road = freezed,Object? pedestrian = freezed,Object? houseNumber = freezed,Object? neighbourhood = freezed,Object? quarter = freezed,Object? suburb = freezed,Object? cityDistrict = freezed,}) {
  return _then(_self.copyWith(
road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as String?,pedestrian: freezed == pedestrian ? _self.pedestrian : pedestrian // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,neighbourhood: freezed == neighbourhood ? _self.neighbourhood : neighbourhood // ignore: cast_nullable_to_non_nullable
as String?,quarter: freezed == quarter ? _self.quarter : quarter // ignore: cast_nullable_to_non_nullable
as String?,suburb: freezed == suburb ? _self.suburb : suburb // ignore: cast_nullable_to_non_nullable
as String?,cityDistrict: freezed == cityDistrict ? _self.cityDistrict : cityDistrict // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDTO].
extension AddressDTOPatterns on AddressDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDTO value)  $default,){
final _that = this;
switch (_that) {
case _AddressDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? road,  String? pedestrian,  String? houseNumber,  String? neighbourhood,  String? quarter,  String? suburb,  String? cityDistrict)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.road,_that.pedestrian,_that.houseNumber,_that.neighbourhood,_that.quarter,_that.suburb,_that.cityDistrict);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? road,  String? pedestrian,  String? houseNumber,  String? neighbourhood,  String? quarter,  String? suburb,  String? cityDistrict)  $default,) {final _that = this;
switch (_that) {
case _AddressDTO():
return $default(_that.road,_that.pedestrian,_that.houseNumber,_that.neighbourhood,_that.quarter,_that.suburb,_that.cityDistrict);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? road,  String? pedestrian,  String? houseNumber,  String? neighbourhood,  String? quarter,  String? suburb,  String? cityDistrict)?  $default,) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.road,_that.pedestrian,_that.houseNumber,_that.neighbourhood,_that.quarter,_that.suburb,_that.cityDistrict);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AddressDTO implements AddressDTO {
  const _AddressDTO({required this.road, required this.pedestrian, required this.houseNumber, required this.neighbourhood, required this.quarter, required this.suburb, required this.cityDistrict});
  factory _AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);

@override final  String? road;
@override final  String? pedestrian;
@override final  String? houseNumber;
@override final  String? neighbourhood;
@override final  String? quarter;
@override final  String? suburb;
@override final  String? cityDistrict;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDTOCopyWith<_AddressDTO> get copyWith => __$AddressDTOCopyWithImpl<_AddressDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDTO&&(identical(other.road, road) || other.road == road)&&(identical(other.pedestrian, pedestrian) || other.pedestrian == pedestrian)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.neighbourhood, neighbourhood) || other.neighbourhood == neighbourhood)&&(identical(other.quarter, quarter) || other.quarter == quarter)&&(identical(other.suburb, suburb) || other.suburb == suburb)&&(identical(other.cityDistrict, cityDistrict) || other.cityDistrict == cityDistrict));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,road,pedestrian,houseNumber,neighbourhood,quarter,suburb,cityDistrict);

@override
String toString() {
  return 'AddressDTO(road: $road, pedestrian: $pedestrian, houseNumber: $houseNumber, neighbourhood: $neighbourhood, quarter: $quarter, suburb: $suburb, cityDistrict: $cityDistrict)';
}


}

/// @nodoc
abstract mixin class _$AddressDTOCopyWith<$Res> implements $AddressDTOCopyWith<$Res> {
  factory _$AddressDTOCopyWith(_AddressDTO value, $Res Function(_AddressDTO) _then) = __$AddressDTOCopyWithImpl;
@override @useResult
$Res call({
 String? road, String? pedestrian, String? houseNumber, String? neighbourhood, String? quarter, String? suburb, String? cityDistrict
});




}
/// @nodoc
class __$AddressDTOCopyWithImpl<$Res>
    implements _$AddressDTOCopyWith<$Res> {
  __$AddressDTOCopyWithImpl(this._self, this._then);

  final _AddressDTO _self;
  final $Res Function(_AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? road = freezed,Object? pedestrian = freezed,Object? houseNumber = freezed,Object? neighbourhood = freezed,Object? quarter = freezed,Object? suburb = freezed,Object? cityDistrict = freezed,}) {
  return _then(_AddressDTO(
road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as String?,pedestrian: freezed == pedestrian ? _self.pedestrian : pedestrian // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,neighbourhood: freezed == neighbourhood ? _self.neighbourhood : neighbourhood // ignore: cast_nullable_to_non_nullable
as String?,quarter: freezed == quarter ? _self.quarter : quarter // ignore: cast_nullable_to_non_nullable
as String?,suburb: freezed == suburb ? _self.suburb : suburb // ignore: cast_nullable_to_non_nullable
as String?,cityDistrict: freezed == cityDistrict ? _self.cityDistrict : cityDistrict // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
