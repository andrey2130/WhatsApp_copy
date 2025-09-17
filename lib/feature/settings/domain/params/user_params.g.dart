// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserParams _$UserParamsFromJson(Map<String, dynamic> json) => _UserParams(
  uid: json['uid'] as String,
  email: json['email'] as String?,
  name: json['name'] as String? ?? '',
  bio: json['bio'] as String? ?? '',
  photoUrl: json['photoUrl'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String?,
  links:
      (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
);

Map<String, dynamic> _$UserParamsToJson(_UserParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'links': instance.links,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
