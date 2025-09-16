import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/feature/auth/domain/params/auth_via_phone/login_via_phone_params.dart';
import 'package:telegram_copy/feature/auth/domain/params/login_params.dart';

abstract class UserDataSource {
  Future<void> saveUserDataEmail(User user, LoginParams params);
  Future<void> saveUserData(User user, LoginViaPhoneParams params);
  Future<Map<String, dynamic>?> getUserData(String userId);
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore;

  UserDataSourceImpl(this._firestore);

  @override
  Future<void> saveUserDataEmail(User user, LoginParams params) async {
    try {
      print('Saving user data to Firestore for user: ${user.uid}');
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': params.email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('User data saved successfully to Firestore');
    } catch (e) {
      print('Error saving user data: $e');
      rethrow;
    }
  }

  @override
  Future<void> saveUserData(User user, LoginViaPhoneParams params) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'phoneNumber': params.phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving user data: $e');
      rethrow;
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
      print('Error getting user data: $e');
      rethrow;
    }
  }
}
