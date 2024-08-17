import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/message.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/network_service.dart';
// import 'package:pdp_quiz_app_with_my_backand/src/core/utils/show_snack_bar_extension.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/web_socket/purposes.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/blocked/blocked_page_controller.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/profile/controller/chat_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../storage/app_storage.dart';
import 'models/purpose_and_data.dart';

class WebSocketController {
  static const String _webSockedUrl = "ws://${NetworkService.wifiApi}:4040/ws";
  static WebSocketChannel? channel;
  static bool isConnected = false;
  static bool previouslyConnected = false;

  static Future<bool> connectWebSocket(BuildContext context) async {
    final String uid = (await AppStorage.load(StorageKey.uid))!;
    try {
      channel = WebSocketChannel.connect(Uri.parse("$_webSockedUrl?uid=$uid"));
      isConnected = true;
      if(context.mounted) _listen(context);
      return true;
    } catch(e) {
      isConnected = false;
      return false;
    }
  }

  static reconnect(BuildContext context) {
    if(isConnected) return;

    // context.showSnackBar("Serverga ulanaolmadik, iltimos internetni tekshirib ko'ring");
    Future.delayed(const Duration(seconds: 5), () {
      connectWebSocket(context);
    });
  }

  static void _listen(BuildContext context) {
    if(!isConnected) return;
    if(previouslyConnected) {
      // context.showSnackBar("Server aloqasi tiklandi.");
    } else {
      previouslyConnected = true;
    }

    channel?.stream.listen((event) {
      _onEvent(context, PurposeAndData.fromJson(jsonDecode(event)));
    }, onDone: () {
      isConnected = false;
      reconnect(context);
    },
    //     onError: () {
    //   isConnected = false;
    //   reconnect(context);
    // }
    );
  }

  static void _onEvent(BuildContext context, PurposeAndData purposeAndData) {
    log(purposeAndData.purpose.name);

    switch(purposeAndData.purpose){
      case Purposes.message:
        ChatController().onMessage(Message.fromJson(purposeAndData.data));
        return;
      case Purposes.active:
        BlockedPageController().active(context);
        return;
      case Purposes.blocked:
        BlockedPageController().blocked(context);
        return;
      case Purposes.allMessages:
        final List<Message> messages = List<Message>.from(purposeAndData.data["messages"].map((e) => Message.fromJson(e)));
        ChatController().allMessages(messages);
        return;
      case Purposes.unknown:
        return;
    }
  }


  static void disconnectWebSocket() {
    channel?.sink.close(status.goingAway);
    isConnected = false;
  }
}
