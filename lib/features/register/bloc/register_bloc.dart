import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/register/bloc/register_events.dart';
import 'package:learning_app/features/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates())
  {
    on<UserNameEvent>(userNameEvent);
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
    on<ConfirmPasswordEvent>(confirmPasswordEvent);
  }

  void userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    debugPrint("password ${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }

  void emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    debugPrint("password ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    debugPrint("password ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    debugPrint("password ${event.confirmPassword}");
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
