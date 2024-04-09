import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';

abstract class IHomeRepository {
Future<HomeEntity?> fetchHomeData();
}