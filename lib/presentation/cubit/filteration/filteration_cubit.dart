import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'filteration_state.dart';

class FilterationCubit extends Cubit<FilterationState> {
  FilterationCubit() : super(FilterationInitialState());

  int currentIndex = 0;
  int sortIndex = 0;
  double minPrice = 200;
  double maxPrice = 200;
  double rating = 3.0;
  String? selectedLocation;
  final List<String> locations = [
    'الرياض, السعودية',
    'جدة, السعودية',
    'مكة, السعودية'
  ];
  final List<String> service = [
    'الكل',
    'تنظيف داخلي ',
    'تنظيف خارجي',
  ];
  final List<String> sort = [
    'الكل',
    'السعر',
    'المسافه',
    'نتائج',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  void changeSortIndex(int index) {
    sortIndex = index;
    emit(ChangeSortState());
  }

  void changeDropDownValue(String? newValue) {
    selectedLocation = newValue;
    emit(ChangeDropDownValueState());
  }

  void sliderChange(RangeValues values) {
    minPrice = values.start;
    maxPrice = values.end;
    emit(ChangeSilderValueState());
  }

  void changeRatingValue(double rating) {
    rating = rating;
    emit(ChangeRatingValueState());
  }
}
