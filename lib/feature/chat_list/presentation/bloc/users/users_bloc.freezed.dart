// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersEvent()';
}


}

/// @nodoc
class $UsersEventCopyWith<$Res>  {
$UsersEventCopyWith(UsersEvent _, $Res Function(UsersEvent) __);
}


/// Adds pattern-matching-related methods to [UsersEvent].
extension UsersEventPatterns on UsersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsersStarted value)?  started,TResult Function( UsersLoad value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsersStarted() when started != null:
return started(_that);case UsersLoad() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsersStarted value)  started,required TResult Function( UsersLoad value)  load,}){
final _that = this;
switch (_that) {
case UsersStarted():
return started(_that);case UsersLoad():
return load(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsersStarted value)?  started,TResult? Function( UsersLoad value)?  load,}){
final _that = this;
switch (_that) {
case UsersStarted() when started != null:
return started(_that);case UsersLoad() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsersStarted() when started != null:
return started();case UsersLoad() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  load,}) {final _that = this;
switch (_that) {
case UsersStarted():
return started();case UsersLoad():
return load();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case UsersStarted() when started != null:
return started();case UsersLoad() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class UsersStarted implements UsersEvent {
  const UsersStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersEvent.started()';
}


}




/// @nodoc


class UsersLoad implements UsersEvent {
  const UsersLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersEvent.load()';
}


}




/// @nodoc
mixin _$UsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState()';
}


}

/// @nodoc
class $UsersStateCopyWith<$Res>  {
$UsersStateCopyWith(UsersState _, $Res Function(UsersState) __);
}


/// Adds pattern-matching-related methods to [UsersState].
extension UsersStatePatterns on UsersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsersInitial value)?  initial,TResult Function( UsersLoading value)?  loading,TResult Function( UsersError value)?  error,TResult Function( UsersSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsersInitial() when initial != null:
return initial(_that);case UsersLoading() when loading != null:
return loading(_that);case UsersError() when error != null:
return error(_that);case UsersSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsersInitial value)  initial,required TResult Function( UsersLoading value)  loading,required TResult Function( UsersError value)  error,required TResult Function( UsersSuccess value)  success,}){
final _that = this;
switch (_that) {
case UsersInitial():
return initial(_that);case UsersLoading():
return loading(_that);case UsersError():
return error(_that);case UsersSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsersInitial value)?  initial,TResult? Function( UsersLoading value)?  loading,TResult? Function( UsersError value)?  error,TResult? Function( UsersSuccess value)?  success,}){
final _that = this;
switch (_that) {
case UsersInitial() when initial != null:
return initial(_that);case UsersLoading() when loading != null:
return loading(_that);case UsersError() when error != null:
return error(_that);case UsersSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<UserParams> users)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsersInitial() when initial != null:
return initial();case UsersLoading() when loading != null:
return loading();case UsersError() when error != null:
return error(_that.message);case UsersSuccess() when success != null:
return success(_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<UserParams> users)  success,}) {final _that = this;
switch (_that) {
case UsersInitial():
return initial();case UsersLoading():
return loading();case UsersError():
return error(_that.message);case UsersSuccess():
return success(_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<UserParams> users)?  success,}) {final _that = this;
switch (_that) {
case UsersInitial() when initial != null:
return initial();case UsersLoading() when loading != null:
return loading();case UsersError() when error != null:
return error(_that.message);case UsersSuccess() when success != null:
return success(_that.users);case _:
  return null;

}
}

}

/// @nodoc


class UsersInitial implements UsersState {
  const UsersInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.initial()';
}


}




/// @nodoc


class UsersLoading implements UsersState {
  const UsersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.loading()';
}


}




/// @nodoc


class UsersError implements UsersState {
  const UsersError({required this.message});
  

 final  String message;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersErrorCopyWith<UsersError> get copyWith => _$UsersErrorCopyWithImpl<UsersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UsersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UsersErrorCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersErrorCopyWith(UsersError value, $Res Function(UsersError) _then) = _$UsersErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UsersErrorCopyWithImpl<$Res>
    implements $UsersErrorCopyWith<$Res> {
  _$UsersErrorCopyWithImpl(this._self, this._then);

  final UsersError _self;
  final $Res Function(UsersError) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UsersError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UsersSuccess implements UsersState {
  const UsersSuccess({required final  List<UserParams> users}): _users = users;
  

 final  List<UserParams> _users;
 List<UserParams> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersSuccessCopyWith<UsersSuccess> get copyWith => _$UsersSuccessCopyWithImpl<UsersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersSuccess&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersState.success(users: $users)';
}


}

/// @nodoc
abstract mixin class $UsersSuccessCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $UsersSuccessCopyWith(UsersSuccess value, $Res Function(UsersSuccess) _then) = _$UsersSuccessCopyWithImpl;
@useResult
$Res call({
 List<UserParams> users
});




}
/// @nodoc
class _$UsersSuccessCopyWithImpl<$Res>
    implements $UsersSuccessCopyWith<$Res> {
  _$UsersSuccessCopyWithImpl(this._self, this._then);

  final UsersSuccess _self;
  final $Res Function(UsersSuccess) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(UsersSuccess(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserParams>,
  ));
}


}

// dart format on
