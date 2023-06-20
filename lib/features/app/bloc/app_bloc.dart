import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/app/bloc/app_events.dart';
import 'package:learning_app/features/app/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvents, AppState>{
  AppBloc(): super(AppState()) {

    on<ChangeBottomNavBarEvent>((event, emit){
      emit(AppState(index: event.index));
    });

    List<Widget> screens = [
      const Center(child: Text("Home"),),
      const Center(child: Text("Search"),),
      const Center(child: Text("Play"),),
      const Center(child: Text("Chat"),),
      const Center(child: Text("My profile"),),
      const Center(child: Text("screen 3"),),
    ];
  }


}