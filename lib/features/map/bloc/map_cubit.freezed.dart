// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 LoadingStatus get loadingStatus; List<Incident> get incidents; Set<IncidentLayer> get enabledLayers; String? get selectedIncidentId; UserLocation? get userLocation; Set<String> get arrivedIds; Set<String> get confirmedByMe; DateTime? get now;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&const DeepCollectionEquality().equals(other.incidents, incidents)&&const DeepCollectionEquality().equals(other.enabledLayers, enabledLayers)&&(identical(other.selectedIncidentId, selectedIncidentId) || other.selectedIncidentId == selectedIncidentId)&&(identical(other.userLocation, userLocation) || other.userLocation == userLocation)&&const DeepCollectionEquality().equals(other.arrivedIds, arrivedIds)&&const DeepCollectionEquality().equals(other.confirmedByMe, confirmedByMe)&&(identical(other.now, now) || other.now == now));
}


@override
int get hashCode => Object.hash(runtimeType,loadingStatus,const DeepCollectionEquality().hash(incidents),const DeepCollectionEquality().hash(enabledLayers),selectedIncidentId,userLocation,const DeepCollectionEquality().hash(arrivedIds),const DeepCollectionEquality().hash(confirmedByMe),now);

@override
String toString() {
  return 'MapState(loadingStatus: $loadingStatus, incidents: $incidents, enabledLayers: $enabledLayers, selectedIncidentId: $selectedIncidentId, userLocation: $userLocation, arrivedIds: $arrivedIds, confirmedByMe: $confirmedByMe, now: $now)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 LoadingStatus loadingStatus, List<Incident> incidents, Set<IncidentLayer> enabledLayers, String? selectedIncidentId, UserLocation? userLocation, Set<String> arrivedIds, Set<String> confirmedByMe, DateTime? now
});


$UserLocationCopyWith<$Res>? get userLocation;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadingStatus = null,Object? incidents = null,Object? enabledLayers = null,Object? selectedIncidentId = freezed,Object? userLocation = freezed,Object? arrivedIds = null,Object? confirmedByMe = null,Object? now = freezed,}) {
  return _then(_self.copyWith(
loadingStatus: null == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,incidents: null == incidents ? _self.incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<Incident>,enabledLayers: null == enabledLayers ? _self.enabledLayers : enabledLayers // ignore: cast_nullable_to_non_nullable
as Set<IncidentLayer>,selectedIncidentId: freezed == selectedIncidentId ? _self.selectedIncidentId : selectedIncidentId // ignore: cast_nullable_to_non_nullable
as String?,userLocation: freezed == userLocation ? _self.userLocation : userLocation // ignore: cast_nullable_to_non_nullable
as UserLocation?,arrivedIds: null == arrivedIds ? _self.arrivedIds : arrivedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,confirmedByMe: null == confirmedByMe ? _self.confirmedByMe : confirmedByMe // ignore: cast_nullable_to_non_nullable
as Set<String>,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLocationCopyWith<$Res>? get userLocation {
    if (_self.userLocation == null) {
    return null;
  }

  return $UserLocationCopyWith<$Res>(_self.userLocation!, (value) {
    return _then(_self.copyWith(userLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadingStatus loadingStatus,  List<Incident> incidents,  Set<IncidentLayer> enabledLayers,  String? selectedIncidentId,  UserLocation? userLocation,  Set<String> arrivedIds,  Set<String> confirmedByMe,  DateTime? now)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.loadingStatus,_that.incidents,_that.enabledLayers,_that.selectedIncidentId,_that.userLocation,_that.arrivedIds,_that.confirmedByMe,_that.now);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadingStatus loadingStatus,  List<Incident> incidents,  Set<IncidentLayer> enabledLayers,  String? selectedIncidentId,  UserLocation? userLocation,  Set<String> arrivedIds,  Set<String> confirmedByMe,  DateTime? now)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.loadingStatus,_that.incidents,_that.enabledLayers,_that.selectedIncidentId,_that.userLocation,_that.arrivedIds,_that.confirmedByMe,_that.now);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadingStatus loadingStatus,  List<Incident> incidents,  Set<IncidentLayer> enabledLayers,  String? selectedIncidentId,  UserLocation? userLocation,  Set<String> arrivedIds,  Set<String> confirmedByMe,  DateTime? now)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.loadingStatus,_that.incidents,_that.enabledLayers,_that.selectedIncidentId,_that.userLocation,_that.arrivedIds,_that.confirmedByMe,_that.now);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
  const _MapState({this.loadingStatus = LoadingStatus.initial, final  List<Incident> incidents = const [], final  Set<IncidentLayer> enabledLayers = const {IncidentLayer.infrastructure, IncidentLayer.airQuality, IncidentLayer.weather, IncidentLayer.neighbours}, this.selectedIncidentId = null, this.userLocation = null, final  Set<String> arrivedIds = const {}, final  Set<String> confirmedByMe = const {}, this.now = null}): _incidents = incidents,_enabledLayers = enabledLayers,_arrivedIds = arrivedIds,_confirmedByMe = confirmedByMe;
  

@override@JsonKey() final  LoadingStatus loadingStatus;
 final  List<Incident> _incidents;
@override@JsonKey() List<Incident> get incidents {
  if (_incidents is EqualUnmodifiableListView) return _incidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidents);
}

 final  Set<IncidentLayer> _enabledLayers;
@override@JsonKey() Set<IncidentLayer> get enabledLayers {
  if (_enabledLayers is EqualUnmodifiableSetView) return _enabledLayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_enabledLayers);
}

@override@JsonKey() final  String? selectedIncidentId;
@override@JsonKey() final  UserLocation? userLocation;
 final  Set<String> _arrivedIds;
@override@JsonKey() Set<String> get arrivedIds {
  if (_arrivedIds is EqualUnmodifiableSetView) return _arrivedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_arrivedIds);
}

 final  Set<String> _confirmedByMe;
@override@JsonKey() Set<String> get confirmedByMe {
  if (_confirmedByMe is EqualUnmodifiableSetView) return _confirmedByMe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_confirmedByMe);
}

@override@JsonKey() final  DateTime? now;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&const DeepCollectionEquality().equals(other._incidents, _incidents)&&const DeepCollectionEquality().equals(other._enabledLayers, _enabledLayers)&&(identical(other.selectedIncidentId, selectedIncidentId) || other.selectedIncidentId == selectedIncidentId)&&(identical(other.userLocation, userLocation) || other.userLocation == userLocation)&&const DeepCollectionEquality().equals(other._arrivedIds, _arrivedIds)&&const DeepCollectionEquality().equals(other._confirmedByMe, _confirmedByMe)&&(identical(other.now, now) || other.now == now));
}


@override
int get hashCode => Object.hash(runtimeType,loadingStatus,const DeepCollectionEquality().hash(_incidents),const DeepCollectionEquality().hash(_enabledLayers),selectedIncidentId,userLocation,const DeepCollectionEquality().hash(_arrivedIds),const DeepCollectionEquality().hash(_confirmedByMe),now);

@override
String toString() {
  return 'MapState(loadingStatus: $loadingStatus, incidents: $incidents, enabledLayers: $enabledLayers, selectedIncidentId: $selectedIncidentId, userLocation: $userLocation, arrivedIds: $arrivedIds, confirmedByMe: $confirmedByMe, now: $now)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 LoadingStatus loadingStatus, List<Incident> incidents, Set<IncidentLayer> enabledLayers, String? selectedIncidentId, UserLocation? userLocation, Set<String> arrivedIds, Set<String> confirmedByMe, DateTime? now
});


@override $UserLocationCopyWith<$Res>? get userLocation;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadingStatus = null,Object? incidents = null,Object? enabledLayers = null,Object? selectedIncidentId = freezed,Object? userLocation = freezed,Object? arrivedIds = null,Object? confirmedByMe = null,Object? now = freezed,}) {
  return _then(_MapState(
loadingStatus: null == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,incidents: null == incidents ? _self._incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<Incident>,enabledLayers: null == enabledLayers ? _self._enabledLayers : enabledLayers // ignore: cast_nullable_to_non_nullable
as Set<IncidentLayer>,selectedIncidentId: freezed == selectedIncidentId ? _self.selectedIncidentId : selectedIncidentId // ignore: cast_nullable_to_non_nullable
as String?,userLocation: freezed == userLocation ? _self.userLocation : userLocation // ignore: cast_nullable_to_non_nullable
as UserLocation?,arrivedIds: null == arrivedIds ? _self._arrivedIds : arrivedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,confirmedByMe: null == confirmedByMe ? _self._confirmedByMe : confirmedByMe // ignore: cast_nullable_to_non_nullable
as Set<String>,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLocationCopyWith<$Res>? get userLocation {
    if (_self.userLocation == null) {
    return null;
  }

  return $UserLocationCopyWith<$Res>(_self.userLocation!, (value) {
    return _then(_self.copyWith(userLocation: value));
  });
}
}

// dart format on
