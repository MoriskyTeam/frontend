// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmState {

 bool get ringing; bool get strobe;
/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmStateCopyWith<AlarmState> get copyWith => _$AlarmStateCopyWithImpl<AlarmState>(this as AlarmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmState&&(identical(other.ringing, ringing) || other.ringing == ringing)&&(identical(other.strobe, strobe) || other.strobe == strobe));
}


@override
int get hashCode => Object.hash(runtimeType,ringing,strobe);

@override
String toString() {
  return 'AlarmState(ringing: $ringing, strobe: $strobe)';
}


}

/// @nodoc
abstract mixin class $AlarmStateCopyWith<$Res>  {
  factory $AlarmStateCopyWith(AlarmState value, $Res Function(AlarmState) _then) = _$AlarmStateCopyWithImpl;
@useResult
$Res call({
 bool ringing, bool strobe
});




}
/// @nodoc
class _$AlarmStateCopyWithImpl<$Res>
    implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._self, this._then);

  final AlarmState _self;
  final $Res Function(AlarmState) _then;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ringing = null,Object? strobe = null,}) {
  return _then(_self.copyWith(
ringing: null == ringing ? _self.ringing : ringing // ignore: cast_nullable_to_non_nullable
as bool,strobe: null == strobe ? _self.strobe : strobe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmState].
extension AlarmStatePatterns on AlarmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmState value)  $default,){
final _that = this;
switch (_that) {
case _AlarmState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmState value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ringing,  bool strobe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
return $default(_that.ringing,_that.strobe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ringing,  bool strobe)  $default,) {final _that = this;
switch (_that) {
case _AlarmState():
return $default(_that.ringing,_that.strobe);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ringing,  bool strobe)?  $default,) {final _that = this;
switch (_that) {
case _AlarmState() when $default != null:
return $default(_that.ringing,_that.strobe);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmState implements AlarmState {
  const _AlarmState({this.ringing = false, this.strobe = true});
  

@override@JsonKey() final  bool ringing;
@override@JsonKey() final  bool strobe;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmStateCopyWith<_AlarmState> get copyWith => __$AlarmStateCopyWithImpl<_AlarmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmState&&(identical(other.ringing, ringing) || other.ringing == ringing)&&(identical(other.strobe, strobe) || other.strobe == strobe));
}


@override
int get hashCode => Object.hash(runtimeType,ringing,strobe);

@override
String toString() {
  return 'AlarmState(ringing: $ringing, strobe: $strobe)';
}


}

/// @nodoc
abstract mixin class _$AlarmStateCopyWith<$Res> implements $AlarmStateCopyWith<$Res> {
  factory _$AlarmStateCopyWith(_AlarmState value, $Res Function(_AlarmState) _then) = __$AlarmStateCopyWithImpl;
@override @useResult
$Res call({
 bool ringing, bool strobe
});




}
/// @nodoc
class __$AlarmStateCopyWithImpl<$Res>
    implements _$AlarmStateCopyWith<$Res> {
  __$AlarmStateCopyWithImpl(this._self, this._then);

  final _AlarmState _self;
  final $Res Function(_AlarmState) _then;

/// Create a copy of AlarmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ringing = null,Object? strobe = null,}) {
  return _then(_AlarmState(
ringing: null == ringing ? _self.ringing : ringing // ignore: cast_nullable_to_non_nullable
as bool,strobe: null == strobe ? _self.strobe : strobe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
