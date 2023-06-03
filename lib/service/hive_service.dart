import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_boxes.dart';

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    Directory directory = await getApplicationSupportDirectory();
    await Hive.initFlutter(directory.path);
    await Hive.openBox(HiveBoxNames.prefs);
  }
}
