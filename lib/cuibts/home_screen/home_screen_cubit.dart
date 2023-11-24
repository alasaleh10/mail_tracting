import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mail_tracking/view/home/screens/done.dart';
import 'package:mail_tracking/view/home/screens/failed.dart';
import 'package:mail_tracking/view/home/screens/waiting.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  List pages = const [
    Done(),
    Waiting(),
    Failed(),
   
  ];

  int selectedIndex = 0;
  changepage(int index) {
    selectedIndex = index;
    emit(HomeScreenInitial());
  }
}
