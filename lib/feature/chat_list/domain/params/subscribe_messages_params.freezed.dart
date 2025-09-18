// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_messages_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscribeMessagesParams {

 String get conversationId;
/// Create a copy of SubscribeMessagesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeMessagesParamsCopyWith<SubscribeMessagesParams> get copyWith => _$SubscribeMessagesParamsCopyWithImpl<SubscribeMessagesParams>(this as SubscribeMessagesParams, _$identity);

  /// Serializes this SubscribeMessagesParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeMessagesParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'SubscribeMessagesParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $SubscribeMessagesParamsCopyWith<$Res>  {
  factory $SubscribeMessagesParamsCopyWith(SubscribeMessagesParams value, $Res Function(SubscribeMessagesParams) _then) = _$SubscribeMessagesParamsCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$SubscribeMessagesParamsCopyWithImpl<$Res>
    implements $SubscribeMessagesParamsCopyWith<$Res> {
  _$SubscribeMessagesParamsCopyWithImpl(this._self, this._then);

  final SubscribeMessagesParams _self;
  final $Res Function(SubscribeMessagesParams) _then;

/// Create a copy of SubscribeMessagesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,}) {
  return _then(_self.copyWith(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscribeMessagesParams].
extension SubscribeMessagesParamsPatterns on SubscribeMessagesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscribeMessagesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscribeMessagesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscribeMessagesParams value)  $default,){
final _that = this;
switch (_that) {
case _SubscribeMessagesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscribeMessagesParams value)?  $default,){
final _that = this;
switch (_that) {
case _SubscribeMessagesParams() when $default != null:
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
case _SubscribeMessagesParams() when $default != null:
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
case _SubscribeMessagesParams():
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
case _SubscribeMessagesParams() when $default != null:
return $default(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscribeMessagesParams implements SubscribeMessagesParams {
  const _SubscribeMessagesParams({required this.conversationId});
  factory _SubscribeMessagesParams.fromJson(Map<String, dynamic> json) => _$SubscribeMessagesParamsFromJson(json);

@override final  String conversationId;

/// Create a copy of SubscribeMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeMessagesParamsCopyWith<_SubscribeMessagesParams> get copyWith => __$SubscribeMessagesParamsCopyWithImpl<_SubscribeMessagesParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscribeMessagesParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscribeMessagesParams&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'SubscribeMessagesParams(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$SubscribeMessagesParamsCopyWith<$Res> implements $SubscribeMessagesParamsCopyWith<$Res> {
  factory _$SubscribeMessagesParamsCopyWith(_SubscribeMessagesParams value, $Res Function(_SubscribeMessagesParams) _then) = __$SubscribeMessagesParamsCopyWithImpl;
@override @useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$SubscribeMessagesParamsCopyWithImpl<$Res>
    implements _$SubscribeMessagesParamsCopyWith<$Res> {
  __$SubscribeMessagesParamsCopyWithImpl(this._self, this._then);

  final _SubscribeMessagesParams _self;
  final $Res Function(_SubscribeMessagesParams) _then;

/// Create a copy of SubscribeMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_SubscribeMessagesParams(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
