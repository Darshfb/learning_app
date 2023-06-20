import 'package:flutter/material.dart';
import 'package:learning_app/features/chat/chat_screen.dart';
import 'package:learning_app/features/home_screen/home_screen.dart';
import 'package:learning_app/features/play/play_screen.dart';
import 'package:learning_app/features/profile/profile_screen.dart';
import 'package:learning_app/features/search/search_screen.dart';

class AppState {
  final int index;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PlayScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
   AppState({this.index = 0});
}
