import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/models/message.dart';
import 'package:pdp_quiz_app_with_my_backand/src/core/storage/app_storage.dart';

import '../../../core/web_socket/web_socket_controller.dart';

class ChatController with ChangeNotifier {
  static final ChatController _singleton = ChatController._internal();
  factory ChatController() => _singleton;
  ChatController._internal();

  final TextEditingController messageController = TextEditingController();
  List<Message> messages = [];
  String uid = "";
  BuildContext? context;

  void initState(BuildContext context, String uid) async {
    this.context = context;
    this.uid = uid;

    WebSocketController.connectWebSocket(context);
    WebSocketController.channel!.sink.add(jsonEncode({
      "purpose": "getAllMessages",
      "data": {"from": uid, "to": "admin"}
    }));

    log("chat initState");
  }

  void onMessage(Message message) {
    messages.insert(0, message);

    WebSocketController.channel?.sink.add(jsonEncode({
      "purpose": "messageReceived",
      "data": {"id": message.id}
    }));

    if(context != null && context!.mounted) {
      onRead(message.id, uid);
      notifyListeners();
    }
  }

  Future<void> onSend() async {
    if (messageController.text
        .trim()
        .isEmpty) return;

    final String uid = (await AppStorage.load(StorageKey.uid))!;
    final DateTime time = DateTime.now();
    final String timestamp = "${time.hour}:${time.minute.toString().padLeft(2, "0")}";

    messages.insert(0, Message(
        id: "messageId",
        status: "loading",
        from: uid,
        to: "admin",
        content: messageController.text.trim(),
        timestamp: timestamp
    ));

    messageController.clear();
    notifyListeners();

    if (WebSocketController.channel != null) {
      final Message message = messages.first.copyWith(status: "sent");

      WebSocketController.channel!.sink.add(jsonEncode({
        "purpose": "message",
        "data": {...message.toJson}
      }));

      messages.first = message;
      notifyListeners();
    }
  }

  void onRead(String id, String uid) {
    log("read message");
    WebSocketController.channel?.sink.add(jsonEncode({
    "purpose": "messageRead",
    "data": {"id": id, "from": "admin", "to": uid}
  }));
  }

  void allMessages(List<Message> messages) {
    this.messages = messages;
    notifyListeners();
  }



  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
