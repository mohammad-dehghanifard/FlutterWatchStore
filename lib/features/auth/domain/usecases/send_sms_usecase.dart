import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class SendSmsUseCase extends UseCase<Map<String,dynamic>,String> {
  SendSmsUseCase(this.repository);
  final AuthRepository repository;

  @override
  Future<Map<String,dynamic>> call(String params) async => repository.sendSms(params);
  
}