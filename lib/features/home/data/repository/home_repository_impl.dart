import 'package:flutter_watch_store/features/home/data/data_source/remote/home_api_provider.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';
import 'package:flutter_watch_store/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends IHomeRepository {
  HomeRepositoryImpl(this.apiProvider);
  final HomeApiProvider apiProvider;
  @override
  Future<HomeEntity?> fetchHomeData() => apiProvider.fetchHomeData();

}