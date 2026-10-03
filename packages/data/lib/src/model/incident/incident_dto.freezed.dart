// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentDTO {

 String? get id; String? get layer; String? get category; String? get severity; String? get status; String? get source; String? get title; String? get description; String? get address; double? get lat; double? get lng; DateTime? get reportedAt; DateTime? get updatedAt; int? get confirmations; int? get areaRadiusMeters; AirReadingDTO? get airReading; String? get photoPath; bool? get reportedByMe;
/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentDTOCopyWith<IncidentDTO> get copyWith => _$IncidentDTOCopyWithImpl<IncidentDTO>(this as IncidentDTO, _$identity);

  /// Serializes this IncidentDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.layer, layer) || other.layer == layer)&&(identical(other.category, category) || other.category == category)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.confirmations, confirmations) || other.confirmations == confirmations)&&(identical(other.areaRadiusMeters, areaRadiusMeters) || other.areaRadiusMeters == areaRadiusMeters)&&(identical(other.airReading, airReading) || other.airReading == airReading)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.reportedByMe, reportedByMe) || other.reportedByMe == reportedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,layer,category,severity,status,source,title,description,address,lat,lng,reportedAt,updatedAt,confirmations,areaRadiusMeters,airReading,photoPath,reportedByMe);

@override
String toString() {
  return 'IncidentDTO(id: $id, layer: $layer, category: $category, severity: $severity, status: $status, source: $source, title: $title, description: $description, address: $address, lat: $lat, lng: $lng, reportedAt: $reportedAt, updatedAt: $updatedAt, confirmations: $confirmations, areaRadiusMeters: $areaRadiusMeters, airReading: $airReading, photoPath: $photoPath, reportedByMe: $reportedByMe)';
}


}

/// @nodoc
abstract mixin class $IncidentDTOCopyWith<$Res>  {
  factory $IncidentDTOCopyWith(IncidentDTO value, $Res Function(IncidentDTO) _then) = _$IncidentDTOCopyWithImpl;
@useResult
$Res call({
 String? id, String? layer, String? category, String? severity, String? status, String? source, String? title, String? description, String? address, double? lat, double? lng, DateTime? reportedAt, DateTime? updatedAt, int? confirmations, int? areaRadiusMeters, AirReadingDTO? airReading, String? photoPath, bool? reportedByMe
});


$AirReadingDTOCopyWith<$Res>? get airReading;

}
/// @nodoc
class _$IncidentDTOCopyWithImpl<$Res>
    implements $IncidentDTOCopyWith<$Res> {
  _$IncidentDTOCopyWithImpl(this._self, this._then);

  final IncidentDTO _self;
  final $Res Function(IncidentDTO) _then;

/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? layer = freezed,Object? category = freezed,Object? severity = freezed,Object? status = freezed,Object? source = freezed,Object? title = freezed,Object? description = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? reportedAt = freezed,Object? updatedAt = freezed,Object? confirmations = freezed,Object? areaRadiusMeters = freezed,Object? airReading = freezed,Object? photoPath = freezed,Object? reportedByMe = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,layer: freezed == layer ? _self.layer : layer // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,reportedAt: freezed == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmations: freezed == confirmations ? _self.confirmations : confirmations // ignore: cast_nullable_to_non_nullable
as int?,areaRadiusMeters: freezed == areaRadiusMeters ? _self.areaRadiusMeters : areaRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,airReading: freezed == airReading ? _self.airReading : airReading // ignore: cast_nullable_to_non_nullable
as AirReadingDTO?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,reportedByMe: freezed == reportedByMe ? _self.reportedByMe : reportedByMe // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirReadingDTOCopyWith<$Res>? get airReading {
    if (_self.airReading == null) {
    return null;
  }

  return $AirReadingDTOCopyWith<$Res>(_self.airReading!, (value) {
    return _then(_self.copyWith(airReading: value));
  });
}
}


/// Adds pattern-matching-related methods to [IncidentDTO].
extension IncidentDTOPatterns on IncidentDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentDTO value)  $default,){
final _that = this;
switch (_that) {
case _IncidentDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentDTO value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? layer,  String? category,  String? severity,  String? status,  String? source,  String? title,  String? description,  String? address,  double? lat,  double? lng,  DateTime? reportedAt,  DateTime? updatedAt,  int? confirmations,  int? areaRadiusMeters,  AirReadingDTO? airReading,  String? photoPath,  bool? reportedByMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentDTO() when $default != null:
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.lat,_that.lng,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.photoPath,_that.reportedByMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? layer,  String? category,  String? severity,  String? status,  String? source,  String? title,  String? description,  String? address,  double? lat,  double? lng,  DateTime? reportedAt,  DateTime? updatedAt,  int? confirmations,  int? areaRadiusMeters,  AirReadingDTO? airReading,  String? photoPath,  bool? reportedByMe)  $default,) {final _that = this;
switch (_that) {
case _IncidentDTO():
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.lat,_that.lng,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.photoPath,_that.reportedByMe);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? layer,  String? category,  String? severity,  String? status,  String? source,  String? title,  String? description,  String? address,  double? lat,  double? lng,  DateTime? reportedAt,  DateTime? updatedAt,  int? confirmations,  int? areaRadiusMeters,  AirReadingDTO? airReading,  String? photoPath,  bool? reportedByMe)?  $default,) {final _that = this;
switch (_that) {
case _IncidentDTO() when $default != null:
return $default(_that.id,_that.layer,_that.category,_that.severity,_that.status,_that.source,_that.title,_that.description,_that.address,_that.lat,_that.lng,_that.reportedAt,_that.updatedAt,_that.confirmations,_that.areaRadiusMeters,_that.airReading,_that.photoPath,_that.reportedByMe);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _IncidentDTO implements IncidentDTO {
  const _IncidentDTO({required this.id, required this.layer, required this.category, required this.severity, required this.status, required this.source, required this.title, required this.description, required this.address, required this.lat, required this.lng, required this.reportedAt, required this.updatedAt, required this.confirmations, required this.areaRadiusMeters, required this.airReading, required this.photoPath, required this.reportedByMe});
  factory _IncidentDTO.fromJson(Map<String, dynamic> json) => _$IncidentDTOFromJson(json);

@override final  String? id;
@override final  String? layer;
@override final  String? category;
@override final  String? severity;
@override final  String? status;
@override final  String? source;
@override final  String? title;
@override final  String? description;
@override final  String? address;
@override final  double? lat;
@override final  double? lng;
@override final  DateTime? reportedAt;
@override final  DateTime? updatedAt;
@override final  int? confirmations;
@override final  int? areaRadiusMeters;
@override final  AirReadingDTO? airReading;
@override final  String? photoPath;
@override final  bool? reportedByMe;

/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentDTOCopyWith<_IncidentDTO> get copyWith => __$IncidentDTOCopyWithImpl<_IncidentDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.layer, layer) || other.layer == layer)&&(identical(other.category, category) || other.category == category)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.confirmations, confirmations) || other.confirmations == confirmations)&&(identical(other.areaRadiusMeters, areaRadiusMeters) || other.areaRadiusMeters == areaRadiusMeters)&&(identical(other.airReading, airReading) || other.airReading == airReading)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.reportedByMe, reportedByMe) || other.reportedByMe == reportedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,layer,category,severity,status,source,title,description,address,lat,lng,reportedAt,updatedAt,confirmations,areaRadiusMeters,airReading,photoPath,reportedByMe);

@override
String toString() {
  return 'IncidentDTO(id: $id, layer: $layer, category: $category, severity: $severity, status: $status, source: $source, title: $title, description: $description, address: $address, lat: $lat, lng: $lng, reportedAt: $reportedAt, updatedAt: $updatedAt, confirmations: $confirmations, areaRadiusMeters: $areaRadiusMeters, airReading: $airReading, photoPath: $photoPath, reportedByMe: $reportedByMe)';
}


}

/// @nodoc
abstract mixin class _$IncidentDTOCopyWith<$Res> implements $IncidentDTOCopyWith<$Res> {
  factory _$IncidentDTOCopyWith(_IncidentDTO value, $Res Function(_IncidentDTO) _then) = __$IncidentDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? layer, String? category, String? severity, String? status, String? source, String? title, String? description, String? address, double? lat, double? lng, DateTime? reportedAt, DateTime? updatedAt, int? confirmations, int? areaRadiusMeters, AirReadingDTO? airReading, String? photoPath, bool? reportedByMe
});


@override $AirReadingDTOCopyWith<$Res>? get airReading;

}
/// @nodoc
class __$IncidentDTOCopyWithImpl<$Res>
    implements _$IncidentDTOCopyWith<$Res> {
  __$IncidentDTOCopyWithImpl(this._self, this._then);

  final _IncidentDTO _self;
  final $Res Function(_IncidentDTO) _then;

/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? layer = freezed,Object? category = freezed,Object? severity = freezed,Object? status = freezed,Object? source = freezed,Object? title = freezed,Object? description = freezed,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? reportedAt = freezed,Object? updatedAt = freezed,Object? confirmations = freezed,Object? areaRadiusMeters = freezed,Object? airReading = freezed,Object? photoPath = freezed,Object? reportedByMe = freezed,}) {
  return _then(_IncidentDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,layer: freezed == layer ? _self.layer : layer // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,severity: freezed == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,reportedAt: freezed == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmations: freezed == confirmations ? _self.confirmations : confirmations // ignore: cast_nullable_to_non_nullable
as int?,areaRadiusMeters: freezed == areaRadiusMeters ? _self.areaRadiusMeters : areaRadiusMeters // ignore: cast_nullable_to_non_nullable
as int?,airReading: freezed == airReading ? _self.airReading : airReading // ignore: cast_nullable_to_non_nullable
as AirReadingDTO?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,reportedByMe: freezed == reportedByMe ? _self.reportedByMe : reportedByMe // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of IncidentDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirReadingDTOCopyWith<$Res>? get airReading {
    if (_self.airReading == null) {
    return null;
  }

  return $AirReadingDTOCopyWith<$Res>(_self.airReading!, (value) {
    return _then(_self.copyWith(airReading: value));
  });
}
}


/// @nodoc
mixin _$AirReadingDTO {

 int? get indexLevel; double? get pm25; double? get pm10;
/// Create a copy of AirReadingDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirReadingDTOCopyWith<AirReadingDTO> get copyWith => _$AirReadingDTOCopyWithImpl<AirReadingDTO>(this as AirReadingDTO, _$identity);

  /// Serializes this AirReadingDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirReadingDTO&&(identical(other.indexLevel, indexLevel) || other.indexLevel == indexLevel)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,indexLevel,pm25,pm10);

@override
String toString() {
  return 'AirReadingDTO(indexLevel: $indexLevel, pm25: $pm25, pm10: $pm10)';
}


}

/// @nodoc
abstract mixin class $AirReadingDTOCopyWith<$Res>  {
  factory $AirReadingDTOCopyWith(AirReadingDTO value, $Res Function(AirReadingDTO) _then) = _$AirReadingDTOCopyWithImpl;
@useResult
$Res call({
 int? indexLevel, double? pm25, double? pm10
});




}
/// @nodoc
class _$AirReadingDTOCopyWithImpl<$Res>
    implements $AirReadingDTOCopyWith<$Res> {
  _$AirReadingDTOCopyWithImpl(this._self, this._then);

  final AirReadingDTO _self;
  final $Res Function(AirReadingDTO) _then;

/// Create a copy of AirReadingDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? indexLevel = freezed,Object? pm25 = freezed,Object? pm10 = freezed,}) {
  return _then(_self.copyWith(
indexLevel: freezed == indexLevel ? _self.indexLevel : indexLevel // ignore: cast_nullable_to_non_nullable
as int?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirReadingDTO].
extension AirReadingDTOPatterns on AirReadingDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirReadingDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirReadingDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirReadingDTO value)  $default,){
final _that = this;
switch (_that) {
case _AirReadingDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirReadingDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AirReadingDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? indexLevel,  double? pm25,  double? pm10)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirReadingDTO() when $default != null:
return $default(_that.indexLevel,_that.pm25,_that.pm10);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? indexLevel,  double? pm25,  double? pm10)  $default,) {final _that = this;
switch (_that) {
case _AirReadingDTO():
return $default(_that.indexLevel,_that.pm25,_that.pm10);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? indexLevel,  double? pm25,  double? pm10)?  $default,) {final _that = this;
switch (_that) {
case _AirReadingDTO() when $default != null:
return $default(_that.indexLevel,_that.pm25,_that.pm10);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AirReadingDTO implements AirReadingDTO {
  const _AirReadingDTO({required this.indexLevel, required this.pm25, required this.pm10});
  factory _AirReadingDTO.fromJson(Map<String, dynamic> json) => _$AirReadingDTOFromJson(json);

@override final  int? indexLevel;
@override final  double? pm25;
@override final  double? pm10;

/// Create a copy of AirReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirReadingDTOCopyWith<_AirReadingDTO> get copyWith => __$AirReadingDTOCopyWithImpl<_AirReadingDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirReadingDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirReadingDTO&&(identical(other.indexLevel, indexLevel) || other.indexLevel == indexLevel)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.pm10, pm10) || other.pm10 == pm10));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,indexLevel,pm25,pm10);

@override
String toString() {
  return 'AirReadingDTO(indexLevel: $indexLevel, pm25: $pm25, pm10: $pm10)';
}


}

/// @nodoc
abstract mixin class _$AirReadingDTOCopyWith<$Res> implements $AirReadingDTOCopyWith<$Res> {
  factory _$AirReadingDTOCopyWith(_AirReadingDTO value, $Res Function(_AirReadingDTO) _then) = __$AirReadingDTOCopyWithImpl;
@override @useResult
$Res call({
 int? indexLevel, double? pm25, double? pm10
});




}
/// @nodoc
class __$AirReadingDTOCopyWithImpl<$Res>
    implements _$AirReadingDTOCopyWith<$Res> {
  __$AirReadingDTOCopyWithImpl(this._self, this._then);

  final _AirReadingDTO _self;
  final $Res Function(_AirReadingDTO) _then;

/// Create a copy of AirReadingDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? indexLevel = freezed,Object? pm25 = freezed,Object? pm10 = freezed,}) {
  return _then(_AirReadingDTO(
indexLevel: freezed == indexLevel ? _self.indexLevel : indexLevel // ignore: cast_nullable_to_non_nullable
as int?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
