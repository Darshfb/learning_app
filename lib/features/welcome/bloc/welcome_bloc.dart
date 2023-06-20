import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/welcome/bloc/welcome_events.dart';
import 'package:learning_app/features/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBloc() : super(WelcomeStates()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeStates(page: state.page));
    });
  }
}
