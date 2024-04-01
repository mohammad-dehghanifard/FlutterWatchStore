import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/check_otp_request.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class CheckKOtpUseCase extends UseCase<bool,CheckOtpRequest> {
  CheckKOtpUseCase(this.repository);
  final AuthRepository repository;
  @override
  Future<bool> call(CheckOtpRequest params) => repository.checkOtpCode(params.mobile, params.code);
}