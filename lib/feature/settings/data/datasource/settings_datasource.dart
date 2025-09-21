import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';
import 'package:telegram_copy/injections.dart';

abstract class SettingsDatasource {
  Future<UserParams> getUserData();
  Future<void> updateUserName({required String name});
  Future<void> updateAbout({required String about});
}

@Injectable(as: SettingsDatasource)
class SettingsDatasourceImpl implements SettingsDatasource {
  final FirebaseFirestore _firestore;

  SettingsDatasourceImpl(this._firestore);

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
}
