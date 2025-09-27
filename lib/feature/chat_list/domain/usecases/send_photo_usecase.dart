import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:telegram_copy/core/error/failure.dart';
import 'package:telegram_copy/feature/chat_list/domain/params/message_params/message.dart';
import 'package:telegram_copy/feature/chat_list/domain/repo/chat_repo.dart';

@injectable
class SendPhotoUsecase {
  final ChatRepo _repository;

  SendPhotoUsecase(this._repository);

  Future<Either<Failure, MessageParams>> call(
    MessageParams params,
    Uint8List file,
  ) async {
    return await _repository.sendPhoto(params, file);
  }
}