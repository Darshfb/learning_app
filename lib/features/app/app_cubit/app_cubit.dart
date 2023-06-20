import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/features/app/app_cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(InitialAppState());

  int currentIndex = 0;
  List<Widget> screens = [
    const Center(child: Text("Home"),),
    const Center(child: Text("Search"),),
    const Center(child: Text("Play"),),
    const Center(child: Text("Chat"),),
    const Center(child: Text("My profile"),),
    const Center(child: Text("screen 3"),),
  ];

  void changeBottomNavBar({required int index}){
    currentIndex = index;
    emit(BottomNavBarState());
  }
}