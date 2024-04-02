import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/check_otp_request.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class CheckKOtpUseCase extends UseCase<Map<String,dynamic>,CheckOtpRequest> {
  CheckKOtpUseCase(this.repository);
  final AuthRepository repository;
  @override
  Future<Map<String,dynamic>> call(CheckOtpRequest params) => repository.checkOtpCode(params.mobile, params.code);
}