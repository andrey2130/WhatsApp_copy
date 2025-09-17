import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_params.freezed.dart';

@freezed
abstract class GetUsersParams with _$GetUsersParams {
  const factory GetUsersParams() = _GetUsersParams;
}
