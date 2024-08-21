import 'package:car_care/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'car_care.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const CarCare());
}
//width = 392.7
//height = 781