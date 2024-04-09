import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';
import 'package:flutter_watch_store/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_watch_store/features/home/presentation/bloc/home_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase useCase;
  HomeBloc(this.useCase) : super(HomeState(homeStatus: HomeLoading())) {

    on<FetchHomeDataEvent>((event, emit) async {
      emit(state.copyWith(HomeLoading()));
      final HomeEntity? homeData = await useCase(NoParams());

      if(homeData == null || homeData.result == false) {
        emit(state.copyWith(HomeError(homeData?.message ?? "خطای ناشاخته، با پشتیبانی تماس بگیرید")));
      } else {
        emit(state.copyWith(HomeSuccess(homeData)));
      }
    });

  }
}
