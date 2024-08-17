import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/message.dart';

class MessageView extends StatefulWidget {
  final String uid;
  final int index;
  final List<Message> messages;
  final Function(String id) onRead;

  const MessageView({
    super.key,
    required this.uid,
    required this.index,
    required this.messages,
    required this.onRead
  });

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  void initState() {
    widget.onRead(widget.messages[widget.index].id);
    super.initState();
    log("read");
  }

  @override
  Widget build(BuildContext context) {
    final Message message = widget.messages[widget.index];
    final bool isMyMessage = message.from == widget.uid;
    final bool isPreviousMessageMine = widget.index != widget.messages.length - 1 && widget.messages[widget.index + 1].from == widget.uid;

    return Padding(
      padding: EdgeInsets.only(
        top: widget.index != widget.messages.length - 1 && widget.messages[widget.index + 1].from == "admin" && isMyMessage ? 15 : 0,
        bottom: widget.index != 0 && widget.messages[widget.index - 1].from == "admin" && isMyMessage ? 15 : 2,
      ),
      child: Align(
        alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isMyMessage ? const Color(0xffEFFEDD) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  widget.index != widget.messages.length - 1
                    && widget.messages[widget.index + 1].from == "admin"
                    && !isMyMessage ? 5 : 16
                ),
                topRight: Radius.circular(isPreviousMessageMine && isMyMessage ? 5 : 16),
                bottomLeft: Radius.circular(isMyMessage ? 16 : 2),
                bottomRight: Radius.circular(isMyMessage ? 2 : 16)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 4),
                    child: SelectableText(
                      message.content,
                      style: const TextStyle(fontSize: 12.6),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(6, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 8),
                        Text(message.timestamp, style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xff7FBE72)
                        )),
                        const SizedBox(width: 5),
                        if(isMyMessage) Icon(
                          message.status == "unread" || message.status == "sent"
                              ? Icons.done_rounded
                              : message.status == "read"
                              ? Icons.done_all_rounded
                              : CupertinoIcons.clock,
                          color: const Color(0xff7FBE72),
                          size: 14,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
