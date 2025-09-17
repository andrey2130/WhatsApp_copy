import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/feature/settings/domain/params/user_params.dart';

abstract class ChatListDatasource {
  Future<List<UserParams>> getAllUsers();
}

@Injectable(as: ChatListDatasource)
class ChatListDatasourceImpl implements ChatListDatasource {
  final FirebaseFirestore _firestore;

  ChatListDatasourceImpl(this._firestore);

  @override
  Future<List<UserParams>> getAllUsers() async {
    final snap = await _firestore.collection('users').get();
    return snap.docs.map((e) => UserParams.fromJson(e.data())).toList();
  }
}
