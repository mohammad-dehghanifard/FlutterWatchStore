import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/home/data/data_source/remote/home_api_provider.dart';
import 'package:flutter_watch_store/features/home/data/models/home_model.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';
import 'package:flutter_watch_store/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends IHomeRepository {
  HomeRepositoryImpl(this.apiProvider);
  final HomeApiProvider apiProvider;
  @override
  Future<HomeEntity?> fetchHomeData() async {
    final Response response = await apiProvider.fetchHomeData();
    if(response.statusCode == 200) {
      final HomeEntity entity = HomeModel.fromJson(response.data);
      return entity;
    }
    return null;
  }

}