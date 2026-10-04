// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'danger_alarm_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DangerAlarmDTO {

 String? get kind; String? get sourceId; String? get incidentId; String? get title; String? get body; String? get lat; String? get lng;
/// Create a copy of DangerAlarmDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DangerAlarmDTOCopyWith<DangerAlarmDTO> get copyWith => _$DangerAlarmDTOCopyWithImpl<DangerAlarmDTO>(this as DangerAlarmDTO, _$identity);

  /// Serializes this DangerAlarmDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DangerAlarmDTO&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,sourceId,incidentId,title,body,lat,lng);

@override
String toString() {
  return 'DangerAlarmDTO(kind: $kind, sourceId: $sourceId, incidentId: $incidentId, title: $title, body: $body, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $DangerAlarmDTOCopyWith<$Res>  {
  factory $DangerAlarmDTOCopyWith(DangerAlarmDTO value, $Res Function(DangerAlarmDTO) _then) = _$DangerAlarmDTOCopyWithImpl;
@useResult
$Res call({
 String? kind, String? sourceId, String? incidentId, String? title, String? body, String? lat, String? lng
});




}
/// @nodoc
class _$DangerAlarmDTOCopyWithImpl<$Res>
    implements $DangerAlarmDTOCopyWith<$Res> {
  _$DangerAlarmDTOCopyWithImpl(this._self, this._then);

  final DangerAlarmDTO _self;
  final $Res Function(DangerAlarmDTO) _then;

/// Create a copy of DangerAlarmDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = freezed,Object? sourceId = freezed,Object? incidentId = freezed,Object? title = freezed,Object? body = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DangerAlarmDTO].
extension DangerAlarmDTOPatterns on DangerAlarmDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DangerAlarmDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DangerAlarmDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DangerAlarmDTO value)  $default,){
final _that = this;
switch (_that) {
case _DangerAlarmDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DangerAlarmDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DangerAlarmDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kind,  String? sourceId,  String? incidentId,  String? title,  String? body,  String? lat,  String? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DangerAlarmDTO() when $default != null:
return $default(_that.kind,_that.sourceId,_that.incidentId,_that.title,_that.body,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kind,  String? sourceId,  String? incidentId,  String? title,  String? body,  String? lat,  String? lng)  $default,) {final _that = this;
switch (_that) {
case _DangerAlarmDTO():
return $default(_that.kind,_that.sourceId,_that.incidentId,_that.title,_that.body,_that.lat,_that.lng);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kind,  String? sourceId,  String? incidentId,  String? title,  String? body,  String? lat,  String? lng)?  $default,) {final _that = this;
switch (_that) {
case _DangerAlarmDTO() when $default != null:
return $default(_that.kind,_that.sourceId,_that.incidentId,_that.title,_that.body,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DangerAlarmDTO implements DangerAlarmDTO {
  const _DangerAlarmDTO({required this.kind, required this.sourceId, required this.incidentId, required this.title, required this.body, required this.lat, required this.lng});
  factory _DangerAlarmDTO.fromJson(Map<String, dynamic> json) => _$DangerAlarmDTOFromJson(json);

@override final  String? kind;
@override final  String? sourceId;
@override final  String? incidentId;
@override final  String? title;
@override final  String? body;
@override final  String? lat;
@override final  String? lng;

/// Create a copy of DangerAlarmDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DangerAlarmDTOCopyWith<_DangerAlarmDTO> get copyWith => __$DangerAlarmDTOCopyWithImpl<_DangerAlarmDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DangerAlarmDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DangerAlarmDTO&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,sourceId,incidentId,title,body,lat,lng);

@override
String toString() {
  return 'DangerAlarmDTO(kind: $kind, sourceId: $sourceId, incidentId: $incidentId, title: $title, body: $body, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$DangerAlarmDTOCopyWith<$Res> implements $DangerAlarmDTOCopyWith<$Res> {
  factory _$DangerAlarmDTOCopyWith(_DangerAlarmDTO value, $Res Function(_DangerAlarmDTO) _then) = __$DangerAlarmDTOCopyWithImpl;
@override @useResult
$Res call({
 String? kind, String? sourceId, String? incidentId, String? title, String? body, String? lat, String? lng
});




}
/// @nodoc
class __$DangerAlarmDTOCopyWithImpl<$Res>
    implements _$DangerAlarmDTOCopyWith<$Res> {
  __$DangerAlarmDTOCopyWithImpl(this._self, this._then);

  final _DangerAlarmDTO _self;
  final $Res Function(_DangerAlarmDTO) _then;

/// Create a copy of DangerAlarmDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? sourceId = freezed,Object? incidentId = freezed,Object? title = freezed,Object? body = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_DangerAlarmDTO(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
