// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_conversation_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteConversationParams {

 String get conversationId;
/// Create a copy of DeleteConversationParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteConversationParamsCopyWith<DeleteConversationParams> get copyWith => _$DeleteConversationParamsCopyWithImpl<DeleteConversationParams>(this as DeleteConversationParams, _$identity);

  /// Serializes this DeleteConversationParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteConversationParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'DeleteConversationParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $DeleteConversationParamsCopyWith<$Res>  {
  factory $DeleteConversationParamsCopyWith(DeleteConversationParams value, $Res Function(DeleteConversationParams) _then) = _$DeleteConversationParamsCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$DeleteConversationParamsCopyWithImpl<$Res>
    implements $DeleteConversationParamsCopyWith<$Res> {
  _$DeleteConversationParamsCopyWithImpl(this._self, this._then);

  final DeleteConversationParams _self;
  final $Res Function(DeleteConversationParams) _then;

/// Create a copy of DeleteConversationParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,}) {
  return _then(_self.copyWith(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteConversationParams].
extension DeleteConversationParamsPatterns on DeleteConversationParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteConversationParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteConversationParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteConversationParams value)  $default,){
final _that = this;
switch (_that) {
case _DeleteConversationParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteConversationParams value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteConversationParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteConversationParams() when $default != null:
return $default(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId)  $default,) {final _that = this;
switch (_that) {
case _DeleteConversationParams():
return $default(_that.conversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId)?  $default,) {final _that = this;
switch (_that) {
case _DeleteConversationParams() when $default != null:
return $default(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteConversationParams implements DeleteConversationParams {
  const _DeleteConversationParams({required this.conversationId});
  factory _DeleteConversationParams.fromJson(Map<String, dynamic> json) => _$DeleteConversationParamsFromJson(json);

@override final  String conversationId;

/// Create a copy of DeleteConversationParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteConversationParamsCopyWith<_DeleteConversationParams> get copyWith => __$DeleteConversationParamsCopyWithImpl<_DeleteConversationParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteConversationParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteConversationParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'DeleteConversationParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$DeleteConversationParamsCopyWith<$Res> implements $DeleteConversationParamsCopyWith<$Res> {
  factory _$DeleteConversationParamsCopyWith(_DeleteConversationParams value, $Res Function(_DeleteConversationParams) _then) = __$DeleteConversationParamsCopyWithImpl;
@override @useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$DeleteConversationParamsCopyWithImpl<$Res>
    implements _$DeleteConversationParamsCopyWith<$Res> {
  __$DeleteConversationParamsCopyWithImpl(this._self, this._then);

  final _DeleteConversationParams _self;
  final $Res Function(_DeleteConversationParams) _then;

/// Create a copy of DeleteConversationParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_DeleteConversationParams(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
