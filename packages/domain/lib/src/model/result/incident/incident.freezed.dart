// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Incident {

 String get id; IncidentLayer get layer; IncidentCategory get category; IncidentSeverity get severity; IncidentStatus get status; IncidentSource get source; String get title; String get description; String get address; GeoPoint get location; DateTime get reportedAt; DateTime? get updatedAt; int get confirmations; int? get areaRadiusMeters; AirReading? get airReading; WeatherReading? get weatherReading; String? get photoPath;/// True when the current resident filed this report.
 bool get reportedByMe;
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentCopyWith<Incident> get copyWith => _$IncidentCopyWithImpl<Incident>(this as Incident, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.layer, layer) || other.layer == layer)&&(identical(other.category, category) || other.category == category)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.confirmations, confirmations) || other.confirmations == confirmations)&&(identical(other.areaRadiusMeters, areaRadiusMeters) || other.areaRadiusMeters == areaRadiusMeters)&&(identical(other.airReading, airReading) || other.airReading == airReading)&&(identical(other.weatherReading, weatherReading) || other.weatherReading == weatherReading)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.reportedByMe, reportedByMe) || other.reportedByMe == reportedByMe));
}


@override
int get hashCode => Object.hash(runtimeType,id,layer,category,severity,status,source,title,description,address,location,reportedAt,updatedAt,confirmations,areaRadiusMeters,airReading,weatherReading,photoPath,reportedByMe);

@override
String toString() {
  return 'Incident(id: $id, layer: $layer, category: $category, severity: $severity, status: $status, source: $source, title: $title, description: $description, address: $address, location: $location, reportedAt: $reportedAt, updatedAt: $updatedAt, confirmations: $confirmations, areaRadiusMeters: $areaRadiusMeters, airReading: $airReading, weatherReading: $weatherReading, photoPath: $photoPath, reportedByMe: $reportedByMe)';
}


}

/// @nodoc
abstract mixin class $IncidentCopyWith<$Res>  {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) _then) = _$IncidentCopyWithImpl;
@useResult
$Res call({
 String id, IncidentLayer layer, IncidentCategory category, IncidentSeverity severity, IncidentStatus status, IncidentSource source, String title, String description, String address, GeoPoint location, DateTime reportedAt, DateTime? updatedAt, int confirmations, int? areaRadiusMeters, AirReading? airReading, WeatherReading? weatherReading, String? photoPath, bool reportedByMe
});


$GeoPointCopyWith<$Res> get location;$AirReadingCopyWith<$Res>? get airReading;$WeatherReadingCopyWith<$Res>? get weatherReading;

}
/// @nodoc
class _$IncidentCopyWithImpl<$Res>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._self, this._then);

  final Incident _self;
  final $Res Function(Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? layer = null,Object? category = null,Object? severity = null,Object? status = null,Object? source = null,Object? title = null,Object? description = null,Object? address = null,Object? location = null,Object? reportedAt = null,Object? updatedAt = freezed,Object? confirmations = null,Object? areaRadiusMeters = freezed,Object? airReading = freezed,Object? weatherReading = freezed,Object? photoPath = freezed,Object? reportedByMe = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layer: null == layer ? _self.layer : layer // ignore: cast_nullable_to_non_nullable
as IncidentLayer,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as IncidentSeverity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as IncidentSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmations: null == confirmations ? _self.confirmations : confirmations // ignore: cast_nullable_to_non_nullable
as int,areaRadiusMeters: freezed == areaRadiusMeters ? _self.areaRadiusMeters : areaRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,airReading: freezed == airReading ? _self.airReading : airReading // ignore: cast_nullable_to_non_nullable
as AirReading?,weatherReading: freezed == weatherReading ? _self.weatherReading : weatherReading // ignore: cast_nullable_to_non_nullable
as WeatherReading?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,reportedByMe: null == reportedByMe ? _self.reportedByMe : reportedByMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirReadingCopyWith<$Res>? get airReading {
    if (_self.airReading == null) {
    return null;
  }

  return $AirReadingCopyWith<$Res>(_self.airReading!, (value) {
    return _then(_self.copyWith(airReading: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherReadingCopyWith<$Res>? get weatherReading {
    if (_self.weatherReading == null) {
    return null;
  }

  return $WeatherReadingCopyWith<$Res>(_self.weatherReading!, (value) {
    return _then(_self.copyWith(weatherReading: value));
  });
}
}


/// Adds pattern-matching-related methods to [Incident].
extension IncidentPatterns on Incident {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Incident value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Incident value)  $default,){
final _that = this;
switch (_that) {
case _Incident():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Incident value)?  $default,){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  IncidentLayer layer,  IncidentCategory category,  IncidentSeverity severity,  IncidentStatus status,  IncidentSource source,  String title,  String description,  String address,  GeoPoint location,  DateTime reportedAt,  DateTime? updatedAt,  int confirmations,  int? areaRadiusMeters,  AirReading? airReading,  WeatherReading? weatherReading,  String? photoPath,  bool reportedByMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.location,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.weatherReading,_that.photoPath,_that.reportedByMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  IncidentLayer layer,  IncidentCategory category,  IncidentSeverity severity,  IncidentStatus status,  IncidentSource source,  String title,  String description,  String address,  GeoPoint location,  DateTime reportedAt,  DateTime? updatedAt,  int confirmations,  int? areaRadiusMeters,  AirReading? airReading,  WeatherReading? weatherReading,  String? photoPath,  bool reportedByMe)  $default,) {final _that = this;
switch (_that) {
case _Incident():
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.location,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.weatherReading,_that.photoPath,_that.reportedByMe);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  IncidentLayer layer,  IncidentCategory category,  IncidentSeverity severity,  IncidentStatus status,  IncidentSource source,  String title,  String description,  String address,  GeoPoint location,  DateTime reportedAt,  DateTime? updatedAt,  int confirmations,  int? areaRadiusMeters,  AirReading? airReading,  WeatherReading? weatherReading,  String? photoPath,  bool reportedByMe)?  $default,) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.location,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.weatherReading,_that.photoPath,_that.reportedByMe);case _:
  return null;

}
}

}

/// @nodoc


class _Incident implements Incident {
  const _Incident({required this.id, required this.layer, required this.category, required this.severity, required this.status, required this.source, required this.title, required this.description, required this.address, required this.location, required this.reportedAt, required this.updatedAt, required this.confirmations, required this.areaRadiusMeters, required this.airReading, required this.weatherReading, required this.photoPath, required this.reportedByMe});
  

@override final  String id;
@override final  IncidentLayer layer;
@override final  IncidentCategory category;
@override final  IncidentSeverity severity;
@override final  IncidentStatus status;
@override final  IncidentSource source;
@override final  String title;
@override final  String description;
@override final  String address;
@override final  GeoPoint location;
@override final  DateTime reportedAt;
@override final  DateTime? updatedAt;
@override final  int confirmations;
@override final  int? areaRadiusMeters;
@override final  AirReading? airReading;
@override final  WeatherReading? weatherReading;
@override final  String? photoPath;
/// True when the current resident filed this report.
@override final  bool reportedByMe;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentCopyWith<_Incident> get copyWith => __$IncidentCopyWithImpl<_Incident>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.layer, layer) || other.layer == layer)&&(identical(other.category, category) || other.category == category)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.confirmations, confirmations) || other.confirmations == confirmations)&&(identical(other.areaRadiusMeters, areaRadiusMeters) || other.areaRadiusMeters == areaRadiusMeters)&&(identical(other.airReading, airReading) || other.airReading == airReading)&&(identical(other.weatherReading, weatherReading) || other.weatherReading == weatherReading)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.reportedByMe, reportedByMe) || other.reportedByMe == reportedByMe));
}


@override
int get hashCode => Object.hash(runtimeType,id,layer,category,severity,status,source,title,description,address,location,reportedAt,updatedAt,confirmations,areaRadiusMeters,airReading,weatherReading,photoPath,reportedByMe);

@override
String toString() {
  return 'Incident(id: $id, layer: $layer, category: $category, severity: $severity, status: $status, source: $source, title: $title, description: $description, address: $address, location: $location, reportedAt: $reportedAt, updatedAt: $updatedAt, confirmations: $confirmations, areaRadiusMeters: $areaRadiusMeters, airReading: $airReading, weatherReading: $weatherReading, photoPath: $photoPath, reportedByMe: $reportedByMe)';
}


}

/// @nodoc
abstract mixin class _$IncidentCopyWith<$Res> implements $IncidentCopyWith<$Res> {
  factory _$IncidentCopyWith(_Incident value, $Res Function(_Incident) _then) = __$IncidentCopyWithImpl;
@override @useResult
$Res call({
 String id, IncidentLayer layer, IncidentCategory category, IncidentSeverity severity, IncidentStatus status, IncidentSource source, String title, String description, String address, GeoPoint location, DateTime reportedAt, DateTime? updatedAt, int confirmations, int? areaRadiusMeters, AirReading? airReading, WeatherReading? weatherReading, String? photoPath, bool reportedByMe
});


@override $GeoPointCopyWith<$Res> get location;@override $AirReadingCopyWith<$Res>? get airReading;@override $WeatherReadingCopyWith<$Res>? get weatherReading;

}
/// @nodoc
class __$IncidentCopyWithImpl<$Res>
    implements _$IncidentCopyWith<$Res> {
  __$IncidentCopyWithImpl(this._self, this._then);

  final _Incident _self;
  final $Res Function(_Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? layer = null,Object? category = null,Object? severity = null,Object? status = null,Object? source = null,Object? title = null,Object? description = null,Object? address = null,Object? location = null,Object? reportedAt = null,Object? updatedAt = freezed,Object? confirmations = null,Object? areaRadiusMeters = freezed,Object? airReading = freezed,Object? weatherReading = freezed,Object? photoPath = freezed,Object? reportedByMe = null,}) {
  return _then(_Incident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layer: null == layer ? _self.layer : layer // ignore: cast_nullable_to_non_nullable
as IncidentLayer,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidentCategory,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as IncidentSeverity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as IncidentSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmations: null == confirmations ? _self.confirmations : confirmations // ignore: cast_nullable_to_non_nullable
as int,areaRadiusMeters: freezed == areaRadiusMeters ? _self.areaRadiusMeters : areaRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,airReading: freezed == airReading ? _self.airReading : airReading // ignore: cast_nullable_to_non_nullable
as AirReading?,weatherReading: freezed == weatherReading ? _self.weatherReading : weatherReading // ignore: cast_nullable_to_non_nullable
as WeatherReading?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,reportedByMe: null == reportedByMe ? _self.reportedByMe : reportedByMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirReadingCopyWith<$Res>? get airReading {
    if (_self.airReading == null) {
    return null;
  }

  return $AirReadingCopyWith<$Res>(_self.airReading!, (value) {
    return _then(_self.copyWith(airReading: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherReadingCopyWith<$Res>? get weatherReading {
    if (_self.weatherReading == null) {
    return null;
  }

  return $WeatherReadingCopyWith<$Res>(_self.weatherReading!, (value) {
    return _then(_self.copyWith(weatherReading: value));
  });
}
}

// dart format on
