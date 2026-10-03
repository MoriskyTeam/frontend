// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitReportRequest {

 IncidentCategory get category;/// Human-readable headline, e.g. the localised category name.
 String get title; GeoPoint get location;/// Street address of [location], when it could be resolved.
 String? get address; String get description; String? get photoPath;
/// Create a copy of SubmitReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitReportRequestCopyWith<SubmitReportRequest> get copyWith => _$SubmitReportRequestCopyWithImpl<SubmitReportRequest>(this as SubmitReportRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitReportRequest&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}


@override
int get hashCode => Object.hash(runtimeType,category,title,location,address,description,photoPath);

@override
String toString() {
  return 'SubmitReportRequest(category: $category, title: $title, location: $location, address: $address, description: $description, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $SubmitReportRequestCopyWith<$Res>  {
  factory $SubmitReportRequestCopyWith(SubmitReportRequest value, $Res Function(SubmitReportRequest) _then) = _$SubmitReportRequestCopyWithImpl;
@useResult
$Res call({
 IncidentCategory category, String title, GeoPoint location, String? address, String description, String? photoPath
});


$GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class _$SubmitReportRequestCopyWithImpl<$Res>
    implements $SubmitReportRequestCopyWith<$Res> {
  _$SubmitReportRequestCopyWithImpl(this._self, this._then);

  final SubmitReportRequest _self;
  final $Res Function(SubmitReportRequest) _then;

/// Create a copy of SubmitReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? title = null,Object? location = null,Object? address = freezed,Object? description = null,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SubmitReportRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubmitReportRequest].
extension SubmitReportRequestPatterns on SubmitReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IncidentCategory category,  String title,  GeoPoint location,  String? address,  String description,  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitReportRequest() when $default != null:
return $default(_that.category,_that.title,_that.location,_that.address,_that.description,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IncidentCategory category,  String title,  GeoPoint location,  String? address,  String description,  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _SubmitReportRequest():
return $default(_that.category,_that.title,_that.location,_that.address,_that.description,_that.photoPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IncidentCategory category,  String title,  GeoPoint location,  String? address,  String description,  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _SubmitReportRequest() when $default != null:
return $default(_that.category,_that.title,_that.location,_that.address,_that.description,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc


class _SubmitReportRequest implements SubmitReportRequest {
  const _SubmitReportRequest({required this.category, required this.title, required this.location, required this.address, required this.description, required this.photoPath});
  

@override final  IncidentCategory category;
/// Human-readable headline, e.g. the localised category name.
@override final  String title;
@override final  GeoPoint location;
/// Street address of [location], when it could be resolved.
@override final  String? address;
@override final  String description;
@override final  String? photoPath;

/// Create a copy of SubmitReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReportRequestCopyWith<_SubmitReportRequest> get copyWith => __$SubmitReportRequestCopyWithImpl<_SubmitReportRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReportRequest&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}


@override
int get hashCode => Object.hash(runtimeType,category,title,location,address,description,photoPath);

@override
String toString() {
  return 'SubmitReportRequest(category: $category, title: $title, location: $location, address: $address, description: $description, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$SubmitReportRequestCopyWith<$Res> implements $SubmitReportRequestCopyWith<$Res> {
  factory _$SubmitReportRequestCopyWith(_SubmitReportRequest value, $Res Function(_SubmitReportRequest) _then) = __$SubmitReportRequestCopyWithImpl;
@override @useResult
$Res call({
 IncidentCategory category, String title, GeoPoint location, String? address, String description, String? photoPath
});


@override $GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class __$SubmitReportRequestCopyWithImpl<$Res>
    implements _$SubmitReportRequestCopyWith<$Res> {
  __$SubmitReportRequestCopyWithImpl(this._self, this._then);

  final _SubmitReportRequest _self;
  final $Res Function(_SubmitReportRequest) _then;

/// Create a copy of SubmitReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? title = null,Object? location = null,Object? address = freezed,Object? description = null,Object? photoPath = freezed,}) {
  return _then(_SubmitReportRequest(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SubmitReportRequest
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
