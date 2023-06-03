import 'package:hive_flutter/hive_flutter.dart';
import 'hive_boxes.dart';

class AppPrefs {
  static var currentEmployee;

  AppPrefs._();
  static AppPrefs instance = AppPrefs._();

  final Box box = HiveBoxes.prefBox;

  Future<void> setEmployeeService(String? service) async {
    await box.put('employee_service', service);
  }

  String? get employeeService => box.get('employee_service');
}
