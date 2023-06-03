import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  const HiveBoxes._();
  static Box prefBox = Hive.box(HiveBoxNames.prefs);
  static Future<void> clearBoxes() async {
    await Future.wait([
      prefBox.clear(),
    ]);
  }
}

class HiveBoxNames {
  const HiveBoxNames._();
  static const String prefs = 'prefs';
  static const String products = 'products';
  static const String history = 'history';
  static const String employees = 'employees';
}
