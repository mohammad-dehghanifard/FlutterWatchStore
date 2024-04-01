import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class SendSmsUseCase extends UseCase<bool,String> {
  SendSmsUseCase(this.repository);
  final AuthRepository repository;

  @override
  Future<bool> call(String params) => repository.sendSms(params);
  
}