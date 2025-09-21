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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadUsers value)?  loadUsers,TResult Function( LoadedUsers value)?  loadedUsers,TResult Function( LoadedMoreUsers value)?  loadedMoreUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadUsers() when loadUsers != null:
return loadUsers(_that);case LoadedUsers() when loadedUsers != null:
return loadedUsers(_that);case LoadedMoreUsers() when loadedMoreUsers != null:
return loadedMoreUsers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadUsers value)  loadUsers,required TResult Function( LoadedUsers value)  loadedUsers,required TResult Function( LoadedMoreUsers value)  loadedMoreUsers,}){
final _that = this;
switch (_that) {
case LoadUsers():
return loadUsers(_that);case LoadedUsers():
return loadedUsers(_that);case LoadedMoreUsers():
return loadedMoreUsers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadUsers value)?  loadUsers,TResult? Function( LoadedUsers value)?  loadedUsers,TResult? Function( LoadedMoreUsers value)?  loadedMoreUsers,}){
final _that = this;
switch (_that) {
case LoadUsers() when loadUsers != null:
return loadUsers(_that);case LoadedUsers() when loadedUsers != null:
return loadedUsers(_that);case LoadedMoreUsers() when loadedMoreUsers != null:
return loadedMoreUsers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadUsers,TResult Function( List<Map<String, dynamic>> users)?  loadedUsers,TResult Function( List<Map<String, dynamic>> users)?  loadedMoreUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadUsers() when loadUsers != null:
return loadUsers();case LoadedUsers() when loadedUsers != null:
return loadedUsers(_that.users);case LoadedMoreUsers() when loadedMoreUsers != null:
return loadedMoreUsers(_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadUsers,required TResult Function( List<Map<String, dynamic>> users)  loadedUsers,required TResult Function( List<Map<String, dynamic>> users)  loadedMoreUsers,}) {final _that = this;
switch (_that) {
case LoadUsers():
return loadUsers();case LoadedUsers():
return loadedUsers(_that.users);case LoadedMoreUsers():
return loadedMoreUsers(_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadUsers,TResult? Function( List<Map<String, dynamic>> users)?  loadedUsers,TResult? Function( List<Map<String, dynamic>> users)?  loadedMoreUsers,}) {final _that = this;
switch (_that) {
case LoadUsers() when loadUsers != null:
return loadUsers();case LoadedUsers() when loadedUsers != null:
return loadedUsers(_that.users);case LoadedMoreUsers() when loadedMoreUsers != null:
return loadedMoreUsers(_that.users);case _:
  return null;

}
}

}

/// @nodoc


class LoadUsers implements UsersEvent {
  const LoadUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersEvent.loadUsers()';
}


}




/// @nodoc


class LoadedUsers implements UsersEvent {
  const LoadedUsers(final  List<Map<String, dynamic>> users): _users = users;
  

 final  List<Map<String, dynamic>> _users;
 List<Map<String, dynamic>> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedUsersCopyWith<LoadedUsers> get copyWith => _$LoadedUsersCopyWithImpl<LoadedUsers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedUsers&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersEvent.loadedUsers(users: $users)';
}


}

/// @nodoc
abstract mixin class $LoadedUsersCopyWith<$Res> implements $UsersEventCopyWith<$Res> {
  factory $LoadedUsersCopyWith(LoadedUsers value, $Res Function(LoadedUsers) _then) = _$LoadedUsersCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> users
});




}
/// @nodoc
class _$LoadedUsersCopyWithImpl<$Res>
    implements $LoadedUsersCopyWith<$Res> {
  _$LoadedUsersCopyWithImpl(this._self, this._then);

  final LoadedUsers _self;
  final $Res Function(LoadedUsers) _then;

/// Create a copy of UsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(LoadedUsers(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class LoadedMoreUsers implements UsersEvent {
  const LoadedMoreUsers(final  List<Map<String, dynamic>> users): _users = users;
  

 final  List<Map<String, dynamic>> _users;
 List<Map<String, dynamic>> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedMoreUsersCopyWith<LoadedMoreUsers> get copyWith => _$LoadedMoreUsersCopyWithImpl<LoadedMoreUsers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedMoreUsers&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersEvent.loadedMoreUsers(users: $users)';
}


}

/// @nodoc
abstract mixin class $LoadedMoreUsersCopyWith<$Res> implements $UsersEventCopyWith<$Res> {
  factory $LoadedMoreUsersCopyWith(LoadedMoreUsers value, $Res Function(LoadedMoreUsers) _then) = _$LoadedMoreUsersCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> users
});




}
/// @nodoc
class _$LoadedMoreUsersCopyWithImpl<$Res>
    implements $LoadedMoreUsersCopyWith<$Res> {
  _$LoadedMoreUsersCopyWithImpl(this._self, this._then);

  final LoadedMoreUsers _self;
  final $Res Function(LoadedMoreUsers) _then;

/// Create a copy of UsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(LoadedMoreUsers(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( LoadedMore value)?  loadedMore,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case LoadedMore() when loadedMore != null:
return loadedMore(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( LoadedMore value)  loadedMore,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case LoadedMore():
return loadedMore(_that);case ErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( LoadedMore value)?  loadedMore,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case LoadedMore() when loadedMore != null:
return loadedMore(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Map<String, dynamic>> users)?  loaded,TResult Function( List<Map<String, dynamic>> users)?  loadedMore,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.users);case LoadedMore() when loadedMore != null:
return loadedMore(_that.users);case ErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Map<String, dynamic>> users)  loaded,required TResult Function( List<Map<String, dynamic>> users)  loadedMore,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.users);case LoadedMore():
return loadedMore(_that.users);case ErrorState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Map<String, dynamic>> users)?  loaded,TResult? Function( List<Map<String, dynamic>> users)?  loadedMore,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.users);case LoadedMore() when loadedMore != null:
return loadedMore(_that.users);case ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements UsersState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.initial()';
}


}




/// @nodoc


class Loading implements UsersState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersState.loading()';
}


}




/// @nodoc


class Loaded implements UsersState {
  const Loaded(final  List<Map<String, dynamic>> users): _users = users;
  

 final  List<Map<String, dynamic>> _users;
 List<Map<String, dynamic>> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersState.loaded(users: $users)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> users
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(Loaded(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class LoadedMore implements UsersState {
  const LoadedMore(final  List<Map<String, dynamic>> users): _users = users;
  

 final  List<Map<String, dynamic>> _users;
 List<Map<String, dynamic>> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedMoreCopyWith<LoadedMore> get copyWith => _$LoadedMoreCopyWithImpl<LoadedMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedMore&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersState.loadedMore(users: $users)';
}


}

/// @nodoc
abstract mixin class $LoadedMoreCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $LoadedMoreCopyWith(LoadedMore value, $Res Function(LoadedMore) _then) = _$LoadedMoreCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> users
});




}
/// @nodoc
class _$LoadedMoreCopyWithImpl<$Res>
    implements $LoadedMoreCopyWith<$Res> {
  _$LoadedMoreCopyWithImpl(this._self, this._then);

  final LoadedMore _self;
  final $Res Function(LoadedMore) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(LoadedMore(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class ErrorState implements UsersState {
  const ErrorState(this.message);
  

 final  String message;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UsersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
