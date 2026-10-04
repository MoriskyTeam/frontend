// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateReportDTO {

 String? get id; String? get category; String? get title; String? get description; String? get keepPhotoUrl;/// Local file to upload in place of the current photo.
 String? get newPhotoPath; String? get previousPhotoUrl;
/// Create a copy of UpdateReportDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReportDTOCopyWith<UpdateReportDTO> get copyWith => _$UpdateReportDTOCopyWithImpl<UpdateReportDTO>(this as UpdateReportDTO, _$identity);

  /// Serializes this UpdateReportDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReportDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.keepPhotoUrl, keepPhotoUrl) || other.keepPhotoUrl == keepPhotoUrl)&&(identical(other.newPhotoPath, newPhotoPath) || other.newPhotoPath == newPhotoPath)&&(identical(other.previousPhotoUrl, previousPhotoUrl) || other.previousPhotoUrl == previousPhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,description,keepPhotoUrl,newPhotoPath,previousPhotoUrl);

@override
String toString() {
  return 'UpdateReportDTO(id: $id, category: $category, title: $title, description: $description, keepPhotoUrl: $keepPhotoUrl, newPhotoPath: $newPhotoPath, previousPhotoUrl: $previousPhotoUrl)';
}


}

/// @nodoc
abstract mixin class $UpdateReportDTOCopyWith<$Res>  {
  factory $UpdateReportDTOCopyWith(UpdateReportDTO value, $Res Function(UpdateReportDTO) _then) = _$UpdateReportDTOCopyWithImpl;
@useResult
$Res call({
 String? id, String? category, String? title, String? description, String? keepPhotoUrl, String? newPhotoPath, String? previousPhotoUrl
});




}
/// @nodoc
class _$UpdateReportDTOCopyWithImpl<$Res>
    implements $UpdateReportDTOCopyWith<$Res> {
  _$UpdateReportDTOCopyWithImpl(this._self, this._then);

  final UpdateReportDTO _self;
  final $Res Function(UpdateReportDTO) _then;

/// Create a copy of UpdateReportDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? title = freezed,Object? description = freezed,Object? keepPhotoUrl = freezed,Object? newPhotoPath = freezed,Object? previousPhotoUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,keepPhotoUrl: freezed == keepPhotoUrl ? _self.keepPhotoUrl : keepPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,newPhotoPath: freezed == newPhotoPath ? _self.newPhotoPath : newPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,previousPhotoUrl: freezed == previousPhotoUrl ? _self.previousPhotoUrl : previousPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateReportDTO].
extension UpdateReportDTOPatterns on UpdateReportDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateReportDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateReportDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateReportDTO value)  $default,){
final _that = this;
switch (_that) {
case _UpdateReportDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateReportDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateReportDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? category,  String? title,  String? description,  String? keepPhotoUrl,  String? newPhotoPath,  String? previousPhotoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateReportDTO() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.description,_that.keepPhotoUrl,_that.newPhotoPath,_that.previousPhotoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? category,  String? title,  String? description,  String? keepPhotoUrl,  String? newPhotoPath,  String? previousPhotoUrl)  $default,) {final _that = this;
switch (_that) {
case _UpdateReportDTO():
return $default(_that.id,_that.category,_that.title,_that.description,_that.keepPhotoUrl,_that.newPhotoPath,_that.previousPhotoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? category,  String? title,  String? description,  String? keepPhotoUrl,  String? newPhotoPath,  String? previousPhotoUrl)?  $default,) {final _that = this;
switch (_that) {
case _UpdateReportDTO() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.description,_that.keepPhotoUrl,_that.newPhotoPath,_that.previousPhotoUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UpdateReportDTO implements UpdateReportDTO {
  const _UpdateReportDTO({required this.id, required this.category, required this.title, required this.description, required this.keepPhotoUrl, required this.newPhotoPath, required this.previousPhotoUrl});
  factory _UpdateReportDTO.fromJson(Map<String, dynamic> json) => _$UpdateReportDTOFromJson(json);

@override final  String? id;
@override final  String? category;
@override final  String? title;
@override final  String? description;
@override final  String? keepPhotoUrl;
/// Local file to upload in place of the current photo.
@override final  String? newPhotoPath;
@override final  String? previousPhotoUrl;

/// Create a copy of UpdateReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateReportDTOCopyWith<_UpdateReportDTO> get copyWith => __$UpdateReportDTOCopyWithImpl<_UpdateReportDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateReportDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateReportDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.keepPhotoUrl, keepPhotoUrl) || other.keepPhotoUrl == keepPhotoUrl)&&(identical(other.newPhotoPath, newPhotoPath) || other.newPhotoPath == newPhotoPath)&&(identical(other.previousPhotoUrl, previousPhotoUrl) || other.previousPhotoUrl == previousPhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,description,keepPhotoUrl,newPhotoPath,previousPhotoUrl);

@override
String toString() {
  return 'UpdateReportDTO(id: $id, category: $category, title: $title, description: $description, keepPhotoUrl: $keepPhotoUrl, newPhotoPath: $newPhotoPath, previousPhotoUrl: $previousPhotoUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateReportDTOCopyWith<$Res> implements $UpdateReportDTOCopyWith<$Res> {
  factory _$UpdateReportDTOCopyWith(_UpdateReportDTO value, $Res Function(_UpdateReportDTO) _then) = __$UpdateReportDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? category, String? title, String? description, String? keepPhotoUrl, String? newPhotoPath, String? previousPhotoUrl
});




}
/// @nodoc
class __$UpdateReportDTOCopyWithImpl<$Res>
    implements _$UpdateReportDTOCopyWith<$Res> {
  __$UpdateReportDTOCopyWithImpl(this._self, this._then);

  final _UpdateReportDTO _self;
  final $Res Function(_UpdateReportDTO) _then;

/// Create a copy of UpdateReportDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? title = freezed,Object? description = freezed,Object? keepPhotoUrl = freezed,Object? newPhotoPath = freezed,Object? previousPhotoUrl = freezed,}) {
  return _then(_UpdateReportDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,keepPhotoUrl: freezed == keepPhotoUrl ? _self.keepPhotoUrl : keepPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,newPhotoPath: freezed == newPhotoPath ? _self.newPhotoPath : newPhotoPath // ignore: cast_nullable_to_non_nullable
as String?,previousPhotoUrl: freezed == previousPhotoUrl ? _self.previousPhotoUrl : previousPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
