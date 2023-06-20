import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/login/bloc/login_events.dart';
import 'package:learning_app/features/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>((event, emit){
      debugPrint("email ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit){
      debugPrint("password ${event.password}");
      emit(state.copyWith(password: event.password));
    });

  }

  void emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    debugPrint("email ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    debugPrint("password ${event.password}");
    emit(state.copyWith(password: event.password));
  }

}
