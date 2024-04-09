import 'package:flutter_watch_store/features/home/data/models/home_model.dart';

class HomeEntity {
  HomeEntity({this.result,this.message,this.data});

  final bool? result;
  final String? message;
  final HomeData? data;
}