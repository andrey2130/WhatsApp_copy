import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_params.freezed.dart';
part 'user_params.g.dart';

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();
  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is int) return DateTime.fromMillisecondsSinceEpoch(json);
    return null;
  }

  @override
  Object? toJson(DateTime? object) => object;
}

@freezed
abstract class UserParams with _$UserParams {
  const factory UserParams({
    required String uid,
    String? email,
    @Default('') String name,
    @Default('') String bio,
    @Default('') String photoUrl,
    String? phoneNumber,
    @Default(<String>[]) List<String> links,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _UserParams;

  factory UserParams.fromJson(Map<String, dynamic> json) =>
      _$UserParamsFromJson(json);
}
