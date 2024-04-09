import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';
import 'package:flutter_watch_store/features/home/domain/repository/home_repository.dart';

class HomeUseCase extends UseCase<HomeEntity?,NoParams> {
  HomeUseCase(this.repository);
  final IHomeRepository repository;
  @override
  Future<HomeEntity?> call(NoParams params) async {
    final result = await repository.fetchHomeData();
    print(result.toString());
    return result;

  }
}