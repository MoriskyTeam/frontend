// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'danger_alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DangerAlarm {

/// `incident:<id>` or `operator:<uuid>`; one alarm per source.
 String get sourceId;/// The incident to open on the map, null for a bare operator alert.
 String? get incidentId; String get title; String get body; GeoPoint get location;
/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DangerAlarmCopyWith<DangerAlarm> get copyWith => _$DangerAlarmCopyWithImpl<DangerAlarm>(this as DangerAlarm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DangerAlarm&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,sourceId,incidentId,title,body,location);

@override
String toString() {
  return 'DangerAlarm(sourceId: $sourceId, incidentId: $incidentId, title: $title, body: $body, location: $location)';
}


}

/// @nodoc
abstract mixin class $DangerAlarmCopyWith<$Res>  {
  factory $DangerAlarmCopyWith(DangerAlarm value, $Res Function(DangerAlarm) _then) = _$DangerAlarmCopyWithImpl;
@useResult
$Res call({
 String sourceId, String? incidentId, String title, String body, GeoPoint location
});


$GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class _$DangerAlarmCopyWithImpl<$Res>
    implements $DangerAlarmCopyWith<$Res> {
  _$DangerAlarmCopyWithImpl(this._self, this._then);

  final DangerAlarm _self;
  final $Res Function(DangerAlarm) _then;

/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? incidentId = freezed,Object? title = null,Object? body = null,Object? location = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,
  ));
}
/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [DangerAlarm].
extension DangerAlarmPatterns on DangerAlarm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DangerAlarm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DangerAlarm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DangerAlarm value)  $default,){
final _that = this;
switch (_that) {
case _DangerAlarm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DangerAlarm value)?  $default,){
final _that = this;
switch (_that) {
case _DangerAlarm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sourceId,  String? incidentId,  String title,  String body,  GeoPoint location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DangerAlarm() when $default != null:
return $default(_that.sourceId,_that.incidentId,_that.title,_that.body,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sourceId,  String? incidentId,  String title,  String body,  GeoPoint location)  $default,) {final _that = this;
switch (_that) {
case _DangerAlarm():
return $default(_that.sourceId,_that.incidentId,_that.title,_that.body,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sourceId,  String? incidentId,  String title,  String body,  GeoPoint location)?  $default,) {final _that = this;
switch (_that) {
case _DangerAlarm() when $default != null:
return $default(_that.sourceId,_that.incidentId,_that.title,_that.body,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _DangerAlarm implements DangerAlarm {
  const _DangerAlarm({required this.sourceId, required this.incidentId, required this.title, required this.body, required this.location});
  

/// `incident:<id>` or `operator:<uuid>`; one alarm per source.
@override final  String sourceId;
/// The incident to open on the map, null for a bare operator alert.
@override final  String? incidentId;
@override final  String title;
@override final  String body;
@override final  GeoPoint location;

/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DangerAlarmCopyWith<_DangerAlarm> get copyWith => __$DangerAlarmCopyWithImpl<_DangerAlarm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DangerAlarm&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,sourceId,incidentId,title,body,location);

@override
String toString() {
  return 'DangerAlarm(sourceId: $sourceId, incidentId: $incidentId, title: $title, body: $body, location: $location)';
}


}

/// @nodoc
abstract mixin class _$DangerAlarmCopyWith<$Res> implements $DangerAlarmCopyWith<$Res> {
  factory _$DangerAlarmCopyWith(_DangerAlarm value, $Res Function(_DangerAlarm) _then) = __$DangerAlarmCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, String? incidentId, String title, String body, GeoPoint location
});


@override $GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class __$DangerAlarmCopyWithImpl<$Res>
    implements _$DangerAlarmCopyWith<$Res> {
  __$DangerAlarmCopyWithImpl(this._self, this._then);

  final _DangerAlarm _self;
  final $Res Function(_DangerAlarm) _then;

/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? incidentId = freezed,Object? title = null,Object? body = null,Object? location = null,}) {
  return _then(_DangerAlarm(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,
  ));
}

/// Create a copy of DangerAlarm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
