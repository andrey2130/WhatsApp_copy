import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/login_via_phone_params.dart';

import 'package:telegram_copy/feature/auth/domain/params/register_params.dart';
import 'package:telegram_copy/injections.dart';

abstract class UserDataSource {
  Future<void> saveUserDataEmail(User user, RegisterParams params);
  Future<void> saveUserData(User user, LoginViaPhoneParams params);
  Future<Map<String, dynamic>?> getUserData(String userId);
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore;

  UserDataSourceImpl(this._firestore);

  @override
  Future<void> saveUserDataEmail(User user, RegisterParams params) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': params.email,
        'name': params.name,
        'createdAt': FieldValue.serverTimestamp(),
        'bio': params.bio,
      });
    } catch (e) {
      getIt<Talker>().handle(e);
      // Don't rethrow to allow auth to continue even if Firestore fails
    }
  }

  @override
  Future<void> saveUserData(User user, LoginViaPhoneParams params) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'phoneNumber': params.phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
        'bio': params.bio,
      });
    } catch (e) {
      getIt<Talker>().handle(e);
      // Don't rethrow to allow auth to continue even if Firestore fails
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final docSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .get();
      return docSnapshot.data();
    } catch (e) {
      getIt<Talker>().handle(e);
      rethrow;
    }
  }
}
