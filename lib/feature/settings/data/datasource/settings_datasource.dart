import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/settings/domain/params/upload_avatar_params.dart';

import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

abstract class SettingsDatasource {
  Future<UserParams> getUserData();
  Future<void> updateUserName({required String name});
  Future<void> updateAbout({required String about});
  Future<Either<Failure, String>> uploadAvatar({
    required UploadAvatarParams params,
  });
  Future<Either<Failure, void>> deleteAvatar({required String userId});
}

@Injectable(as: SettingsDatasource)
class SettingsDatasourceImpl implements SettingsDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  SettingsDatasourceImpl(this._firestore, this._storage);

  @override
  Future<UserParams> getUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw StateError('User not found');
      }
      final snap = await _firestore.collection('users').doc(uid).get();
      final data = snap.data();
      if (data == null) {
        return UserParams(
          uid: uid,
          email: FirebaseAuth.instance.currentUser?.email,
          name: '',
          bio: 'Hey there! I am using WhatsApp.',
          photoUrl: '',
          phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber,
          links: const <String>[],
          createdAt: null,
          updatedAt: null,
        );
      }
      final safe = {
        'uid': data['uid'] ?? uid,
        'email': data['email'] ?? FirebaseAuth.instance.currentUser?.email,
        'name': data['name'] ?? '',
        'bio': data['bio'] ?? 'Hey there! I am using WhatsApp.',
        'photoUrl': data['photoUrl'] ?? '',
        'phoneNumber':
            data['phoneNumber'] ??
            FirebaseAuth.instance.currentUser?.phoneNumber,
        'links': (data['links'] as List?)?.cast<String>() ?? <String>[],
        'createdAt': data['createdAt'],
        'updatedAt': data['updatedAt'],
      };

      return UserParams.fromJson(safe);
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      rethrow;
    }
  }

  @override
  Future<void> updateUserName({required String name}) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw StateError('User not found');
      }
      await _firestore.collection('users').doc(uid).update({'name': name});
      getIt<Talker>().info('User name updated: $name');
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      rethrow;
    }
  }

  @override
  Future<void> updateAbout({required String about}) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw StateError('User not found');
      }
      await _firestore.collection('users').doc(uid).update({'bio': about});
      getIt<Talker>().info('User about updated: $about');
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> uploadAvatar({
    required UploadAvatarParams params,
  }) async {
    try {
      final ref = _storage
          .ref()
          .child('user_avatars')
          .child('${params.userId}.jpg');
      final file = File(params.filePath);

      final snapshot = await ref.putFile(file); // завантажуємо
      final downloadUrl = await snapshot.ref.getDownloadURL(); // беремо URL

      // Оновлюємо Firestore
      await _firestore.collection('users').doc(params.userId).update({
        'photoUrl': downloadUrl,
      });

      return Right(downloadUrl); // повертаємо URL
    } catch (e, st) {
      getIt<Talker>().handle(e, st);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAvatar({required String userId}) {
    // TODO: implement deleteAvatar
    throw UnimplementedError();
  }
}
