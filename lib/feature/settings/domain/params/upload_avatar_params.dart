import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_avatar_params.freezed.dart';
part 'upload_avatar_params.g.dart';

@freezed 
abstract class UploadAvatarParams with _$UploadAvatarParams {
  const factory UploadAvatarParams({
    required String userId, 
    required String filePath,
  }) = _UploadAvatarParams;

  factory UploadAvatarParams.fromJson(Map<String, dynamic> json) =>
      _$UploadAvatarParamsFromJson(json);
}