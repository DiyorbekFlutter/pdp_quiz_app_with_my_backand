import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../core/storage/app_storage.dart';

final StatusController statusController = StatusController();

class StatusController with ChangeNotifier {
  StatusController() {
    setup();
  }

  Future<void> setup() async {
    isActive = await AppStorage.load(StorageKey.isActive) != "false";
  }

  late bool isActive;

  Future<void> switchStatus() async {
    log("Status controller: $isActive");
    isActive = !isActive;
    log("Status controller: $isActive");
    await AppStorage.store(key: StorageKey.isActive, value: isActive.toString());
    notifyListeners();
  }
}
