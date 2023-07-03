import 'package:easy_chat/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  final _storageBox = Hive.box(Constants.storageBox);

  add(String key, dynamic val) {
    _storageBox.put(key, val);
  }

  dynamic get(String key) {
    return _storageBox.get(key, defaultValue: null);
  }

  dynamic delete(String key) {
    _storageBox.delete(key);
  }
}
