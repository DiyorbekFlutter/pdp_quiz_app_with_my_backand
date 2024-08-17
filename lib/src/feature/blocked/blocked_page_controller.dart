import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/storage/app_storage.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/web_socket/web_socket_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/setting/status_controller.dart';
import 'package:provider/provider.dart';

import '../primary/controller/primary_controller.dart';
import '../setting/inherited_status_notifier.dart';
import 'blocked_page.dart';

class BlockedPageController with ChangeNotifier {
  static final BlockedPageController _singleton = BlockedPageController._internal();
  factory BlockedPageController() => _singleton;
  BlockedPageController._internal();

  // late BuildContext context;

  Future<void> initState(BuildContext context) async {
    // this.context = context;
    WebSocketController.connectWebSocket(context);
  }

  void active(BuildContext context) async {
    // statusController.switchStatus();

    if(context.mounted) {
      // InheritedStatusNotifier.maybeOf(context)?.switchStatus();
      context.read<PrimaryController>().changeIsActiveAccount(true);
      Navigator.pop(context);
    }

    // log("This is active function. ${context.mounted}");
  }

  void blocked(BuildContext context) async {
    // statusController.switchStatus();

    if(context.mounted) {
      // InheritedStatusNotifier.maybeOf(context)?.switchStatus();
      context.read<PrimaryController>().changeIsActiveAccount(false);
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const BlockedPage()));
    }

    // log("This is blocked function. ${context.mounted}");
  }
}
