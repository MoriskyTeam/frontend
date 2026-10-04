// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmSettingsState {

 LoadingStatus get loadingStatus; bool get enabled;
/// Create a copy of AlarmSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmSettingsStateCopyWith<AlarmSettingsState> get copyWith => _$AlarmSettingsStateCopyWithImpl<AlarmSettingsState>(this as AlarmSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmSettingsState&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,loadingStatus,enabled);

@override
String toString() {
  return 'AlarmSettingsState(loadingStatus: $loadingStatus, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $AlarmSettingsStateCopyWith<$Res>  {
  factory $AlarmSettingsStateCopyWith(AlarmSettingsState value, $Res Function(AlarmSettingsState) _then) = _$AlarmSettingsStateCopyWithImpl;
@useResult
$Res call({
 LoadingStatus loadingStatus, bool enabled
});




}
/// @nodoc
class _$AlarmSettingsStateCopyWithImpl<$Res>
    implements $AlarmSettingsStateCopyWith<$Res> {
  _$AlarmSettingsStateCopyWithImpl(this._self, this._then);

  final AlarmSettingsState _self;
  final $Res Function(AlarmSettingsState) _then;

/// Create a copy of AlarmSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadingStatus = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
loadingStatus: null == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmSettingsState].
extension AlarmSettingsStatePatterns on AlarmSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadingStatus loadingStatus,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmSettingsState() when $default != null:
return $default(_that.loadingStatus,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadingStatus loadingStatus,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingsState():
return $default(_that.loadingStatus,_that.enabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadingStatus loadingStatus,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _AlarmSettingsState() when $default != null:
return $default(_that.loadingStatus,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmSettingsState implements AlarmSettingsState {
  const _AlarmSettingsState({this.loadingStatus = LoadingStatus.initial, this.enabled = true});
  

@override@JsonKey() final  LoadingStatus loadingStatus;
@override@JsonKey() final  bool enabled;

/// Create a copy of AlarmSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmSettingsStateCopyWith<_AlarmSettingsState> get copyWith => __$AlarmSettingsStateCopyWithImpl<_AlarmSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmSettingsState&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,loadingStatus,enabled);

@override
String toString() {
  return 'AlarmSettingsState(loadingStatus: $loadingStatus, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$AlarmSettingsStateCopyWith<$Res> implements $AlarmSettingsStateCopyWith<$Res> {
  factory _$AlarmSettingsStateCopyWith(_AlarmSettingsState value, $Res Function(_AlarmSettingsState) _then) = __$AlarmSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 LoadingStatus loadingStatus, bool enabled
});




}
/// @nodoc
class __$AlarmSettingsStateCopyWithImpl<$Res>
    implements _$AlarmSettingsStateCopyWith<$Res> {
  __$AlarmSettingsStateCopyWithImpl(this._self, this._then);

  final _AlarmSettingsState _self;
  final $Res Function(_AlarmSettingsState) _then;

/// Create a copy of AlarmSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadingStatus = null,Object? enabled = null,}) {
  return _then(_AlarmSettingsState(
loadingStatus: null == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as LoadingStatus,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
