// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitReportDTO {

 String? get category; double? get lat; double? get lng; String? get description; String? get photoPath;
/// Create a copy of SubmitReportDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitReportDTOCopyWith<SubmitReportDTO> get copyWith => _$SubmitReportDTOCopyWithImpl<SubmitReportDTO>(this as SubmitReportDTO, _$identity);

  /// Serializes this SubmitReportDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitReportDTO&&(identical(other.category, category) || other.category == category)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,lat,lng,description,photoPath);

@override
String toString() {
  return 'SubmitReportDTO(category: $category, lat: $lat, lng: $lng, description: $description, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $SubmitReportDTOCopyWith<$Res>  {
  factory $SubmitReportDTOCopyWith(SubmitReportDTO value, $Res Function(SubmitReportDTO) _then) = _$SubmitReportDTOCopyWithImpl;
@useResult
$Res call({
 String? category, double? lat, double? lng, String? description, String? photoPath
});




}
/// @nodoc
class _$SubmitReportDTOCopyWithImpl<$Res>
    implements $SubmitReportDTOCopyWith<$Res> {
  _$SubmitReportDTOCopyWithImpl(this._self, this._then);

  final SubmitReportDTO _self;
  final $Res Function(SubmitReportDTO) _then;

/// Create a copy of SubmitReportDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitReportDTO].
extension SubmitReportDTOPatterns on SubmitReportDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitReportDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitReportDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitReportDTO value)  $default,){
final _that = this;
switch (_that) {
case _SubmitReportDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitReportDTO value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitReportDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? category,  double? lat,  double? lng,  String? description,  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitReportDTO() when $default != null:
return $default(_that.category,_that.lat,_that.lng,_that.description,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? category,  double? lat,  double? lng,  String? description,  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _SubmitReportDTO():
return $default(_that.category,_that.lat,_that.lng,_that.description,_that.photoPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? category,  double? lat,  double? lng,  String? description,  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _SubmitReportDTO() when $default != null:
return $default(_that.category,_that.lat,_that.lng,_that.description,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SubmitReportDTO implements SubmitReportDTO {
  const _SubmitReportDTO({required this.category, required this.lat, required this.lng, required this.description, required this.photoPath});
  factory _SubmitReportDTO.fromJson(Map<String, dynamic> json) => _$SubmitReportDTOFromJson(json);

@override final  String? category;
@override final  double? lat;
@override final  double? lng;
@override final  String? description;
@override final  String? photoPath;

/// Create a copy of SubmitReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReportDTOCopyWith<_SubmitReportDTO> get copyWith => __$SubmitReportDTOCopyWithImpl<_SubmitReportDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitReportDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReportDTO&&(identical(other.category, category) || other.category == category)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,lat,lng,description,photoPath);

@override
String toString() {
  return 'SubmitReportDTO(category: $category, lat: $lat, lng: $lng, description: $description, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$SubmitReportDTOCopyWith<$Res> implements $SubmitReportDTOCopyWith<$Res> {
  factory _$SubmitReportDTOCopyWith(_SubmitReportDTO value, $Res Function(_SubmitReportDTO) _then) = __$SubmitReportDTOCopyWithImpl;
@override @useResult
$Res call({
 String? category, double? lat, double? lng, String? description, String? photoPath
});




}
/// @nodoc
class __$SubmitReportDTOCopyWithImpl<$Res>
    implements _$SubmitReportDTOCopyWith<$Res> {
  __$SubmitReportDTOCopyWithImpl(this._self, this._then);

  final _SubmitReportDTO _self;
  final $Res Function(_SubmitReportDTO) _then;

/// Create a copy of SubmitReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? photoPath = freezed,}) {
  return _then(_SubmitReportDTO(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
