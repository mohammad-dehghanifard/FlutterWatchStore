import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/home/presentation/bloc/home_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(homeStatus: HomeInitial())) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
