import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/home/data/models/home_model.dart';

sealed class HomeStatus extends Equatable {
  const HomeStatus();
}

final class HomeInitial extends HomeStatus {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeStatus{
  @override
  List<Object?> get props => [];
}

final class HomeSuccess extends HomeStatus{
  const HomeSuccess(this.homeData);
  final HomeData homeData;
  @override
  List<Object?> get props => [homeData];
}

final class HomeError extends HomeStatus{
  const HomeError(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
