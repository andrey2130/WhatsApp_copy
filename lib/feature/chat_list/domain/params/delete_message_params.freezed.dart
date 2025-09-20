// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_message_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteMessageParams {

 String get messageId;
/// Create a copy of DeleteMessageParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteMessageParamsCopyWith<DeleteMessageParams> get copyWith => _$DeleteMessageParamsCopyWithImpl<DeleteMessageParams>(this as DeleteMessageParams, _$identity);

  /// Serializes this DeleteMessageParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMessageParams&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'DeleteMessageParams(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageParamsCopyWith<$Res>  {
  factory $DeleteMessageParamsCopyWith(DeleteMessageParams value, $Res Function(DeleteMessageParams) _then) = _$DeleteMessageParamsCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$DeleteMessageParamsCopyWithImpl<$Res>
    implements $DeleteMessageParamsCopyWith<$Res> {
  _$DeleteMessageParamsCopyWithImpl(this._self, this._then);

  final DeleteMessageParams _self;
  final $Res Function(DeleteMessageParams) _then;

/// Create a copy of DeleteMessageParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteMessageParams].
extension DeleteMessageParamsPatterns on DeleteMessageParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteMessageParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteMessageParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteMessageParams value)  $default,){
final _that = this;
switch (_that) {
case _DeleteMessageParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteMessageParams value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteMessageParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteMessageParams() when $default != null:
return $default(_that.messageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId)  $default,) {final _that = this;
switch (_that) {
case _DeleteMessageParams():
return $default(_that.messageId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId)?  $default,) {final _that = this;
switch (_that) {
case _DeleteMessageParams() when $default != null:
return $default(_that.messageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteMessageParams implements DeleteMessageParams {
  const _DeleteMessageParams({required this.messageId});
  factory _DeleteMessageParams.fromJson(Map<String, dynamic> json) => _$DeleteMessageParamsFromJson(json);

@override final  String messageId;

/// Create a copy of DeleteMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMessageParamsCopyWith<_DeleteMessageParams> get copyWith => __$DeleteMessageParamsCopyWithImpl<_DeleteMessageParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteMessageParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessageParams&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'DeleteMessageParams(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class _$DeleteMessageParamsCopyWith<$Res> implements $DeleteMessageParamsCopyWith<$Res> {
  factory _$DeleteMessageParamsCopyWith(_DeleteMessageParams value, $Res Function(_DeleteMessageParams) _then) = __$DeleteMessageParamsCopyWithImpl;
@override @useResult
$Res call({
 String messageId
});




}
/// @nodoc
class __$DeleteMessageParamsCopyWithImpl<$Res>
    implements _$DeleteMessageParamsCopyWith<$Res> {
  __$DeleteMessageParamsCopyWithImpl(this._self, this._then);

  final _DeleteMessageParams _self;
  final $Res Function(_DeleteMessageParams) _then;

/// Create a copy of DeleteMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(_DeleteMessageParams(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
