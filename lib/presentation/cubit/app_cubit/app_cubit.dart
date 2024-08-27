import 'package:car_care/presentation/cubit/app_cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  void changeConatinerIndex(int index) {
    selectedIndex.value = index;
    emit(ChangeContainerIndex());
  }
}
