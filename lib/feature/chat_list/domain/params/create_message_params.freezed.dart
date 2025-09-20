// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_message_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMessageParams {

 String get id; String get content; String get conversationId; String get senderId;
/// Create a copy of CreateMessageParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMessageParamsCopyWith<CreateMessageParams> get copyWith => _$CreateMessageParamsCopyWithImpl<CreateMessageParams>(this as CreateMessageParams, _$identity);

  /// Serializes this CreateMessageParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMessageParams&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,conversationId,senderId);

@override
String toString() {
  return 'CreateMessageParams(id: $id, content: $content, conversationId: $conversationId, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class $CreateMessageParamsCopyWith<$Res>  {
  factory $CreateMessageParamsCopyWith(CreateMessageParams value, $Res Function(CreateMessageParams) _then) = _$CreateMessageParamsCopyWithImpl;
@useResult
$Res call({
 String id, String content, String conversationId, String senderId
});




}
/// @nodoc
class _$CreateMessageParamsCopyWithImpl<$Res>
    implements $CreateMessageParamsCopyWith<$Res> {
  _$CreateMessageParamsCopyWithImpl(this._self, this._then);

  final CreateMessageParams _self;
  final $Res Function(CreateMessageParams) _then;

/// Create a copy of CreateMessageParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? conversationId = null,Object? senderId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMessageParams].
extension CreateMessageParamsPatterns on CreateMessageParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMessageParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMessageParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMessageParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateMessageParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMessageParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMessageParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content,  String conversationId,  String senderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMessageParams() when $default != null:
return $default(_that.id,_that.content,_that.conversationId,_that.senderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content,  String conversationId,  String senderId)  $default,) {final _that = this;
switch (_that) {
case _CreateMessageParams():
return $default(_that.id,_that.content,_that.conversationId,_that.senderId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content,  String conversationId,  String senderId)?  $default,) {final _that = this;
switch (_that) {
case _CreateMessageParams() when $default != null:
return $default(_that.id,_that.content,_that.conversationId,_that.senderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMessageParams implements CreateMessageParams {
  const _CreateMessageParams({required this.id, required this.content, required this.conversationId, required this.senderId});
  factory _CreateMessageParams.fromJson(Map<String, dynamic> json) => _$CreateMessageParamsFromJson(json);

@override final  String id;
@override final  String content;
@override final  String conversationId;
@override final  String senderId;

/// Create a copy of CreateMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageParamsCopyWith<_CreateMessageParams> get copyWith => __$CreateMessageParamsCopyWithImpl<_CreateMessageParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMessageParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessageParams&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,conversationId,senderId);

@override
String toString() {
  return 'CreateMessageParams(id: $id, content: $content, conversationId: $conversationId, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageParamsCopyWith<$Res> implements $CreateMessageParamsCopyWith<$Res> {
  factory _$CreateMessageParamsCopyWith(_CreateMessageParams value, $Res Function(_CreateMessageParams) _then) = __$CreateMessageParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, String conversationId, String senderId
});




}
/// @nodoc
class __$CreateMessageParamsCopyWithImpl<$Res>
    implements _$CreateMessageParamsCopyWith<$Res> {
  __$CreateMessageParamsCopyWithImpl(this._self, this._then);

  final _CreateMessageParams _self;
  final $Res Function(_CreateMessageParams) _then;

/// Create a copy of CreateMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? conversationId = null,Object? senderId = null,}) {
  return _then(_CreateMessageParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
