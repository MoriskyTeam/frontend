// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportState {

 IncidentCategory? get category; String get description; String? get photoPath; GeoPoint? get location; bool get locationIsFallback;/// Street address of the pin, resolved after it settles.
 String? get address; LoadingStatus get addressStatus; LoadingStatus get locationStatus; LoadingStatus get submitStatus;
/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportStateCopyWith<ReportState> get copyWith => _$ReportStateCopyWithImpl<ReportState>(this as ReportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportState&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationIsFallback, locationIsFallback) || other.locationIsFallback == locationIsFallback)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressStatus, addressStatus) || other.addressStatus == addressStatus)&&(identical(other.locationStatus, locationStatus) || other.locationStatus == locationStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus));
}


@override
int get hashCode => Object.hash(runtimeType,category,description,photoPath,location,locationIsFallback,address,addressStatus,locationStatus,submitStatus);

@override
String toString() {
  return 'ReportState(category: $category, description: $description, photoPath: $photoPath, location: $location, locationIsFallback: $locationIsFallback, address: $address, addressStatus: $addressStatus, locationStatus: $locationStatus, submitStatus: $submitStatus)';
}


}

/// @nodoc
abstract mixin class $ReportStateCopyWith<$Res>  {
  factory $ReportStateCopyWith(ReportState value, $Res Function(ReportState) _then) = _$ReportStateCopyWithImpl;
@useResult
$Res call({
 IncidentCategory? category, String description, String? photoPath, GeoPoint? location, bool locationIsFallback, String? address, LoadingStatus addressStatus, LoadingStatus locationStatus, LoadingStatus submitStatus
});


$GeoPointCopyWith<$Res>? get location;

}
/// @nodoc
class _$ReportStateCopyWithImpl<$Res>
    implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._self, this._then);

  final ReportState _self;
  final $Res Function(ReportState) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? description = null,Object? photoPath = freezed,Object? location = freezed,Object? locationIsFallback = null,Object? address = freezed,Object? addressStatus = null,Object? locationStatus = null,Object? submitStatus = null,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint?,locationIsFallback: null == locationIsFallback ? _self.locationIsFallback : locationIsFallback // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressStatus: null == addressStatus ? _self.addressStatus : addressStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,locationStatus: null == locationStatus ? _self.locationStatus : locationStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,
  ));
}
/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportState].
extension ReportStatePatterns on ReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportState value)  $default,){
final _that = this;
switch (_that) {
case _ReportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IncidentCategory? category,  String description,  String? photoPath,  GeoPoint? location,  bool locationIsFallback,  String? address,  LoadingStatus addressStatus,  LoadingStatus locationStatus,  LoadingStatus submitStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportState() when $default != null:
return $default(_that.category,_that.description,_that.photoPath,_that.location,_that.locationIsFallback,_that.address,_that.addressStatus,_that.locationStatus,_that.submitStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IncidentCategory? category,  String description,  String? photoPath,  GeoPoint? location,  bool locationIsFallback,  String? address,  LoadingStatus addressStatus,  LoadingStatus locationStatus,  LoadingStatus submitStatus)  $default,) {final _that = this;
switch (_that) {
case _ReportState():
return $default(_that.category,_that.description,_that.photoPath,_that.location,_that.locationIsFallback,_that.address,_that.addressStatus,_that.locationStatus,_that.submitStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IncidentCategory? category,  String description,  String? photoPath,  GeoPoint? location,  bool locationIsFallback,  String? address,  LoadingStatus addressStatus,  LoadingStatus locationStatus,  LoadingStatus submitStatus)?  $default,) {final _that = this;
switch (_that) {
case _ReportState() when $default != null:
return $default(_that.category,_that.description,_that.photoPath,_that.location,_that.locationIsFallback,_that.address,_that.addressStatus,_that.locationStatus,_that.submitStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ReportState implements ReportState {
  const _ReportState({this.category = null, this.description = '', this.photoPath = null, this.location = null, this.locationIsFallback = true, this.address = null, this.addressStatus = LoadingStatus.initial, this.locationStatus = LoadingStatus.initial, this.submitStatus = LoadingStatus.initial});
  

@override@JsonKey() final  IncidentCategory? category;
@override@JsonKey() final  String description;
@override@JsonKey() final  String? photoPath;
@override@JsonKey() final  GeoPoint? location;
@override@JsonKey() final  bool locationIsFallback;
/// Street address of the pin, resolved after it settles.
@override@JsonKey() final  String? address;
@override@JsonKey() final  LoadingStatus addressStatus;
@override@JsonKey() final  LoadingStatus locationStatus;
@override@JsonKey() final  LoadingStatus submitStatus;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportStateCopyWith<_ReportState> get copyWith => __$ReportStateCopyWithImpl<_ReportState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportState&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationIsFallback, locationIsFallback) || other.locationIsFallback == locationIsFallback)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressStatus, addressStatus) || other.addressStatus == addressStatus)&&(identical(other.locationStatus, locationStatus) || other.locationStatus == locationStatus)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus));
}


@override
int get hashCode => Object.hash(runtimeType,category,description,photoPath,location,locationIsFallback,address,addressStatus,locationStatus,submitStatus);

@override
String toString() {
  return 'ReportState(category: $category, description: $description, photoPath: $photoPath, location: $location, locationIsFallback: $locationIsFallback, address: $address, addressStatus: $addressStatus, locationStatus: $locationStatus, submitStatus: $submitStatus)';
}


}

/// @nodoc
abstract mixin class _$ReportStateCopyWith<$Res> implements $ReportStateCopyWith<$Res> {
  factory _$ReportStateCopyWith(_ReportState value, $Res Function(_ReportState) _then) = __$ReportStateCopyWithImpl;
@override @useResult
$Res call({
 IncidentCategory? category, String description, String? photoPath, GeoPoint? location, bool locationIsFallback, String? address, LoadingStatus addressStatus, LoadingStatus locationStatus, LoadingStatus submitStatus
});


@override $GeoPointCopyWith<$Res>? get location;

}
/// @nodoc
class __$ReportStateCopyWithImpl<$Res>
    implements _$ReportStateCopyWith<$Res> {
  __$ReportStateCopyWithImpl(this._self, this._then);

  final _ReportState _self;
  final $Res Function(_ReportState) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? description = null,Object? photoPath = freezed,Object? location = freezed,Object? locationIsFallback = null,Object? address = freezed,Object? addressStatus = null,Object? locationStatus = null,Object? submitStatus = null,}) {
  return _then(_ReportState(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint?,locationIsFallback: null == locationIsFallback ? _self.locationIsFallback : locationIsFallback // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressStatus: null == addressStatus ? _self.addressStatus : addressStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,locationStatus: null == locationStatus ? _self.locationStatus : locationStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,
  ));
}

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
