// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radar_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadarFrame {

 String get tileUrlTemplate; DateTime get time; int get maxNativeZoom;
/// Create a copy of RadarFrame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadarFrameCopyWith<RadarFrame> get copyWith => _$RadarFrameCopyWithImpl<RadarFrame>(this as RadarFrame, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadarFrame&&(identical(other.tileUrlTemplate, tileUrlTemplate) || other.tileUrlTemplate == tileUrlTemplate)&&(identical(other.time, time) || other.time == time)&&(identical(other.maxNativeZoom, maxNativeZoom) || other.maxNativeZoom == maxNativeZoom));
}


@override
int get hashCode => Object.hash(runtimeType,tileUrlTemplate,time,maxNativeZoom);

@override
String toString() {
  return 'RadarFrame(tileUrlTemplate: $tileUrlTemplate, time: $time, maxNativeZoom: $maxNativeZoom)';
}


}

/// @nodoc
abstract mixin class $RadarFrameCopyWith<$Res>  {
  factory $RadarFrameCopyWith(RadarFrame value, $Res Function(RadarFrame) _then) = _$RadarFrameCopyWithImpl;
@useResult
$Res call({
 String tileUrlTemplate, DateTime time, int maxNativeZoom
});




}
/// @nodoc
class _$RadarFrameCopyWithImpl<$Res>
    implements $RadarFrameCopyWith<$Res> {
  _$RadarFrameCopyWithImpl(this._self, this._then);

  final RadarFrame _self;
  final $Res Function(RadarFrame) _then;

/// Create a copy of RadarFrame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tileUrlTemplate = null,Object? time = null,Object? maxNativeZoom = null,}) {
  return _then(_self.copyWith(
tileUrlTemplate: null == tileUrlTemplate ? _self.tileUrlTemplate : tileUrlTemplate // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,maxNativeZoom: null == maxNativeZoom ? _self.maxNativeZoom : maxNativeZoom // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RadarFrame].
extension RadarFramePatterns on RadarFrame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadarFrame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadarFrame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadarFrame value)  $default,){
final _that = this;
switch (_that) {
case _RadarFrame():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadarFrame value)?  $default,){
final _that = this;
switch (_that) {
case _RadarFrame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tileUrlTemplate,  DateTime time,  int maxNativeZoom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadarFrame() when $default != null:
return $default(_that.tileUrlTemplate,_that.time,_that.maxNativeZoom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tileUrlTemplate,  DateTime time,  int maxNativeZoom)  $default,) {final _that = this;
switch (_that) {
case _RadarFrame():
return $default(_that.tileUrlTemplate,_that.time,_that.maxNativeZoom);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tileUrlTemplate,  DateTime time,  int maxNativeZoom)?  $default,) {final _that = this;
switch (_that) {
case _RadarFrame() when $default != null:
return $default(_that.tileUrlTemplate,_that.time,_that.maxNativeZoom);case _:
  return null;

}
}

}

/// @nodoc


class _RadarFrame implements RadarFrame {
  const _RadarFrame({required this.tileUrlTemplate, required this.time, required this.maxNativeZoom});
  

@override final  String tileUrlTemplate;
@override final  DateTime time;
@override final  int maxNativeZoom;

/// Create a copy of RadarFrame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadarFrameCopyWith<_RadarFrame> get copyWith => __$RadarFrameCopyWithImpl<_RadarFrame>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadarFrame&&(identical(other.tileUrlTemplate, tileUrlTemplate) || other.tileUrlTemplate == tileUrlTemplate)&&(identical(other.time, time) || other.time == time)&&(identical(other.maxNativeZoom, maxNativeZoom) || other.maxNativeZoom == maxNativeZoom));
}


@override
int get hashCode => Object.hash(runtimeType,tileUrlTemplate,time,maxNativeZoom);

@override
String toString() {
  return 'RadarFrame(tileUrlTemplate: $tileUrlTemplate, time: $time, maxNativeZoom: $maxNativeZoom)';
}


}

/// @nodoc
abstract mixin class _$RadarFrameCopyWith<$Res> implements $RadarFrameCopyWith<$Res> {
  factory _$RadarFrameCopyWith(_RadarFrame value, $Res Function(_RadarFrame) _then) = __$RadarFrameCopyWithImpl;
@override @useResult
$Res call({
 String tileUrlTemplate, DateTime time, int maxNativeZoom
});




}
/// @nodoc
class __$RadarFrameCopyWithImpl<$Res>
    implements _$RadarFrameCopyWith<$Res> {
  __$RadarFrameCopyWithImpl(this._self, this._then);

  final _RadarFrame _self;
  final $Res Function(_RadarFrame) _then;

/// Create a copy of RadarFrame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tileUrlTemplate = null,Object? time = null,Object? maxNativeZoom = null,}) {
  return _then(_RadarFrame(
tileUrlTemplate: null == tileUrlTemplate ? _self.tileUrlTemplate : tileUrlTemplate // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,maxNativeZoom: null == maxNativeZoom ? _self.maxNativeZoom : maxNativeZoom // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
