// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportPhoto {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPhoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportPhoto()';
}


}

/// @nodoc
class $ReportPhotoCopyWith<$Res>  {
$ReportPhotoCopyWith(ReportPhoto _, $Res Function(ReportPhoto) __);
}


/// Adds pattern-matching-related methods to [ReportPhoto].
extension ReportPhotoPatterns on ReportPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReportPhotoNone value)?  none,TResult Function( ReportPhotoKeep value)?  keep,TResult Function( ReportPhotoReplace value)?  replace,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReportPhotoNone() when none != null:
return none(_that);case ReportPhotoKeep() when keep != null:
return keep(_that);case ReportPhotoReplace() when replace != null:
return replace(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReportPhotoNone value)  none,required TResult Function( ReportPhotoKeep value)  keep,required TResult Function( ReportPhotoReplace value)  replace,}){
final _that = this;
switch (_that) {
case ReportPhotoNone():
return none(_that);case ReportPhotoKeep():
return keep(_that);case ReportPhotoReplace():
return replace(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReportPhotoNone value)?  none,TResult? Function( ReportPhotoKeep value)?  keep,TResult? Function( ReportPhotoReplace value)?  replace,}){
final _that = this;
switch (_that) {
case ReportPhotoNone() when none != null:
return none(_that);case ReportPhotoKeep() when keep != null:
return keep(_that);case ReportPhotoReplace() when replace != null:
return replace(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String url)?  keep,TResult Function( String localPath)?  replace,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReportPhotoNone() when none != null:
return none();case ReportPhotoKeep() when keep != null:
return keep(_that.url);case ReportPhotoReplace() when replace != null:
return replace(_that.localPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String url)  keep,required TResult Function( String localPath)  replace,}) {final _that = this;
switch (_that) {
case ReportPhotoNone():
return none();case ReportPhotoKeep():
return keep(_that.url);case ReportPhotoReplace():
return replace(_that.localPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String url)?  keep,TResult? Function( String localPath)?  replace,}) {final _that = this;
switch (_that) {
case ReportPhotoNone() when none != null:
return none();case ReportPhotoKeep() when keep != null:
return keep(_that.url);case ReportPhotoReplace() when replace != null:
return replace(_that.localPath);case _:
  return null;

}
}

}

/// @nodoc


class ReportPhotoNone implements ReportPhoto {
  const ReportPhotoNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPhotoNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportPhoto.none()';
}


}




/// @nodoc


class ReportPhotoKeep implements ReportPhoto {
  const ReportPhotoKeep({required this.url});
  

 final  String url;

/// Create a copy of ReportPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPhotoKeepCopyWith<ReportPhotoKeep> get copyWith => _$ReportPhotoKeepCopyWithImpl<ReportPhotoKeep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPhotoKeep&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ReportPhoto.keep(url: $url)';
}


}

/// @nodoc
abstract mixin class $ReportPhotoKeepCopyWith<$Res> implements $ReportPhotoCopyWith<$Res> {
  factory $ReportPhotoKeepCopyWith(ReportPhotoKeep value, $Res Function(ReportPhotoKeep) _then) = _$ReportPhotoKeepCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$ReportPhotoKeepCopyWithImpl<$Res>
    implements $ReportPhotoKeepCopyWith<$Res> {
  _$ReportPhotoKeepCopyWithImpl(this._self, this._then);

  final ReportPhotoKeep _self;
  final $Res Function(ReportPhotoKeep) _then;

/// Create a copy of ReportPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(ReportPhotoKeep(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReportPhotoReplace implements ReportPhoto {
  const ReportPhotoReplace({required this.localPath});
  

 final  String localPath;

/// Create a copy of ReportPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPhotoReplaceCopyWith<ReportPhotoReplace> get copyWith => _$ReportPhotoReplaceCopyWithImpl<ReportPhotoReplace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPhotoReplace&&(identical(other.localPath, localPath) || other.localPath == localPath));
}


@override
int get hashCode => Object.hash(runtimeType,localPath);

@override
String toString() {
  return 'ReportPhoto.replace(localPath: $localPath)';
}


}

/// @nodoc
abstract mixin class $ReportPhotoReplaceCopyWith<$Res> implements $ReportPhotoCopyWith<$Res> {
  factory $ReportPhotoReplaceCopyWith(ReportPhotoReplace value, $Res Function(ReportPhotoReplace) _then) = _$ReportPhotoReplaceCopyWithImpl;
@useResult
$Res call({
 String localPath
});




}
/// @nodoc
class _$ReportPhotoReplaceCopyWithImpl<$Res>
    implements $ReportPhotoReplaceCopyWith<$Res> {
  _$ReportPhotoReplaceCopyWithImpl(this._self, this._then);

  final ReportPhotoReplace _self;
  final $Res Function(ReportPhotoReplace) _then;

/// Create a copy of ReportPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? localPath = null,}) {
  return _then(ReportPhotoReplace(
localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UpdateReportRequest {

 String get incidentId; IncidentCategory get category;/// Headline shown on every map, e.g. the localised category name.
 String get title; String get description; ReportPhoto get photo;/// The photo the report had before the edit, removed from storage when
/// it is replaced or dropped.
 String? get previousPhotoUrl;
/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReportRequestCopyWith<UpdateReportRequest> get copyWith => _$UpdateReportRequestCopyWithImpl<UpdateReportRequest>(this as UpdateReportRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReportRequest&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.previousPhotoUrl, previousPhotoUrl) || other.previousPhotoUrl == previousPhotoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,incidentId,category,title,description,photo,previousPhotoUrl);

@override
String toString() {
  return 'UpdateReportRequest(incidentId: $incidentId, category: $category, title: $title, description: $description, photo: $photo, previousPhotoUrl: $previousPhotoUrl)';
}


}

/// @nodoc
abstract mixin class $UpdateReportRequestCopyWith<$Res>  {
  factory $UpdateReportRequestCopyWith(UpdateReportRequest value, $Res Function(UpdateReportRequest) _then) = _$UpdateReportRequestCopyWithImpl;
@useResult
$Res call({
 String incidentId, IncidentCategory category, String title, String description, ReportPhoto photo, String? previousPhotoUrl
});


$ReportPhotoCopyWith<$Res> get photo;

}
/// @nodoc
class _$UpdateReportRequestCopyWithImpl<$Res>
    implements $UpdateReportRequestCopyWith<$Res> {
  _$UpdateReportRequestCopyWithImpl(this._self, this._then);

  final UpdateReportRequest _self;
  final $Res Function(UpdateReportRequest) _then;

/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? incidentId = null,Object? category = null,Object? title = null,Object? description = null,Object? photo = null,Object? previousPhotoUrl = freezed,}) {
  return _then(_self.copyWith(
incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as ReportPhoto,previousPhotoUrl: freezed == previousPhotoUrl ? _self.previousPhotoUrl : previousPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportPhotoCopyWith<$Res> get photo {
  
  return $ReportPhotoCopyWith<$Res>(_self.photo, (value) {
    return _then(_self.copyWith(photo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateReportRequest].
extension UpdateReportRequestPatterns on UpdateReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String incidentId,  IncidentCategory category,  String title,  String description,  ReportPhoto photo,  String? previousPhotoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateReportRequest() when $default != null:
return $default(_that.incidentId,_that.category,_that.title,_that.description,_that.photo,_that.previousPhotoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String incidentId,  IncidentCategory category,  String title,  String description,  ReportPhoto photo,  String? previousPhotoUrl)  $default,) {final _that = this;
switch (_that) {
case _UpdateReportRequest():
return $default(_that.incidentId,_that.category,_that.title,_that.description,_that.photo,_that.previousPhotoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String incidentId,  IncidentCategory category,  String title,  String description,  ReportPhoto photo,  String? previousPhotoUrl)?  $default,) {final _that = this;
switch (_that) {
case _UpdateReportRequest() when $default != null:
return $default(_that.incidentId,_that.category,_that.title,_that.description,_that.photo,_that.previousPhotoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateReportRequest implements UpdateReportRequest {
  const _UpdateReportRequest({required this.incidentId, required this.category, required this.title, required this.description, required this.photo, required this.previousPhotoUrl});
  

@override final  String incidentId;
@override final  IncidentCategory category;
/// Headline shown on every map, e.g. the localised category name.
@override final  String title;
@override final  String description;
@override final  ReportPhoto photo;
/// The photo the report had before the edit, removed from storage when
/// it is replaced or dropped.
@override final  String? previousPhotoUrl;

/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateReportRequestCopyWith<_UpdateReportRequest> get copyWith => __$UpdateReportRequestCopyWithImpl<_UpdateReportRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateReportRequest&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.previousPhotoUrl, previousPhotoUrl) || other.previousPhotoUrl == previousPhotoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,incidentId,category,title,description,photo,previousPhotoUrl);

@override
String toString() {
  return 'UpdateReportRequest(incidentId: $incidentId, category: $category, title: $title, description: $description, photo: $photo, previousPhotoUrl: $previousPhotoUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateReportRequestCopyWith<$Res> implements $UpdateReportRequestCopyWith<$Res> {
  factory _$UpdateReportRequestCopyWith(_UpdateReportRequest value, $Res Function(_UpdateReportRequest) _then) = __$UpdateReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String incidentId, IncidentCategory category, String title, String description, ReportPhoto photo, String? previousPhotoUrl
});


@override $ReportPhotoCopyWith<$Res> get photo;

}
/// @nodoc
class __$UpdateReportRequestCopyWithImpl<$Res>
    implements _$UpdateReportRequestCopyWith<$Res> {
  __$UpdateReportRequestCopyWithImpl(this._self, this._then);

  final _UpdateReportRequest _self;
  final $Res Function(_UpdateReportRequest) _then;

/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? incidentId = null,Object? category = null,Object? title = null,Object? description = null,Object? photo = null,Object? previousPhotoUrl = freezed,}) {
  return _then(_UpdateReportRequest(
incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as ReportPhoto,previousPhotoUrl: freezed == previousPhotoUrl ? _self.previousPhotoUrl : previousPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UpdateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportPhotoCopyWith<$Res> get photo {
  
  return $ReportPhotoCopyWith<$Res>(_self.photo, (value) {
    return _then(_self.copyWith(photo: value));
  });
}
}

// dart format on
