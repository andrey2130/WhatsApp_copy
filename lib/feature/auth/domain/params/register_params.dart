import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';
part 'register_params.g.dart';

@freezed
abstract class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required String email,
    required String password,
    required String confirmPassword,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
