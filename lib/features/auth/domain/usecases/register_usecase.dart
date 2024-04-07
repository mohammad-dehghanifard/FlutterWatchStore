import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/register_request.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase extends UseCase<Map<String,dynamic>,RegisterRequest> {
  RegisterUseCase(this.repository);
  final AuthRepository repository;
  @override
  Future<Map<String, dynamic>> call(RegisterRequest params) async => repository.registerUser(params);

}