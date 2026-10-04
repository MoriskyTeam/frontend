// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_inbox_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmInboxState {

 String? get lastSourceId;
/// Create a copy of AlarmInboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmInboxStateCopyWith<AlarmInboxState> get copyWith => _$AlarmInboxStateCopyWithImpl<AlarmInboxState>(this as AlarmInboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmInboxState&&(identical(other.lastSourceId, lastSourceId) || other.lastSourceId == lastSourceId));
}


@override
int get hashCode => Object.hash(runtimeType,lastSourceId);

@override
String toString() {
  return 'AlarmInboxState(lastSourceId: $lastSourceId)';
}


}

/// @nodoc
abstract mixin class $AlarmInboxStateCopyWith<$Res>  {
  factory $AlarmInboxStateCopyWith(AlarmInboxState value, $Res Function(AlarmInboxState) _then) = _$AlarmInboxStateCopyWithImpl;
@useResult
$Res call({
 String? lastSourceId
});




}
/// @nodoc
class _$AlarmInboxStateCopyWithImpl<$Res>
    implements $AlarmInboxStateCopyWith<$Res> {
  _$AlarmInboxStateCopyWithImpl(this._self, this._then);

  final AlarmInboxState _self;
  final $Res Function(AlarmInboxState) _then;

/// Create a copy of AlarmInboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastSourceId = freezed,}) {
  return _then(_self.copyWith(
lastSourceId: freezed == lastSourceId ? _self.lastSourceId : lastSourceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmInboxState].
extension AlarmInboxStatePatterns on AlarmInboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmInboxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmInboxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmInboxState value)  $default,){
final _that = this;
switch (_that) {
case _AlarmInboxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmInboxState value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmInboxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? lastSourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmInboxState() when $default != null:
return $default(_that.lastSourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? lastSourceId)  $default,) {final _that = this;
switch (_that) {
case _AlarmInboxState():
return $default(_that.lastSourceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? lastSourceId)?  $default,) {final _that = this;
switch (_that) {
case _AlarmInboxState() when $default != null:
return $default(_that.lastSourceId);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmInboxState implements AlarmInboxState {
  const _AlarmInboxState({this.lastSourceId = null});
  

@override@JsonKey() final  String? lastSourceId;

/// Create a copy of AlarmInboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmInboxStateCopyWith<_AlarmInboxState> get copyWith => __$AlarmInboxStateCopyWithImpl<_AlarmInboxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmInboxState&&(identical(other.lastSourceId, lastSourceId) || other.lastSourceId == lastSourceId));
}


@override
int get hashCode => Object.hash(runtimeType,lastSourceId);

@override
String toString() {
  return 'AlarmInboxState(lastSourceId: $lastSourceId)';
}


}

/// @nodoc
abstract mixin class _$AlarmInboxStateCopyWith<$Res> implements $AlarmInboxStateCopyWith<$Res> {
  factory _$AlarmInboxStateCopyWith(_AlarmInboxState value, $Res Function(_AlarmInboxState) _then) = __$AlarmInboxStateCopyWithImpl;
@override @useResult
$Res call({
 String? lastSourceId
});




}
/// @nodoc
class __$AlarmInboxStateCopyWithImpl<$Res>
    implements _$AlarmInboxStateCopyWith<$Res> {
  __$AlarmInboxStateCopyWithImpl(this._self, this._then);

  final _AlarmInboxState _self;
  final $Res Function(_AlarmInboxState) _then;

/// Create a copy of AlarmInboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastSourceId = freezed,}) {
  return _then(_AlarmInboxState(
lastSourceId: freezed == lastSourceId ? _self.lastSourceId : lastSourceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
