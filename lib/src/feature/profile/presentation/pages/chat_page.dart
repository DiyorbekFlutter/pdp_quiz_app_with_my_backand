import 'package:flutter/material.dart';
import 'package:pdp_quiz_app_with_my_backand/src/feature/profile/controller/chat_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/message_view.dart';

class ChatPage extends StatelessWidget {
  final String uid;
  const ChatPage(this.uid, {super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Provider.of<ChatController>(context, listen: false);
    controller.initState(context, uid);
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/chat_background.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Help center", style: TextStyle(fontSize: 18)),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff5586B0),
          ),
          body: Consumer<ChatController>(
            builder: (context, ref, child) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ref.messages.length,
                    reverse: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    itemBuilder: (context, index) => MessageView(
                      uid: uid,
                      index: index,
                      messages: ref.messages,
                      onRead: (id) {
                        // final bool isMyMessage = ref.messages[index].from == uid;

                        // if(!isMyMessage && ref.messages[index].status != "read") {
                          controller.onRead(id, uid);
                        // }
                      },
                    ),
                  ),
                ),

                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    maxHeight: 250
                  ),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Stack(
                        children: [
                          TextFormField(
                            minLines: 1,
                            maxLines: null,
                            cursorColor: Colors.blue,
                            controller: controller.messageController,
                            onFieldSubmitted: (value) => controller.onSend(),
                            decoration: const InputDecoration(
                              hintText: "Massage...",
                              border: InputBorder.none
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(MediaQuery.of(context).size.width - 75, 0),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () => controller.onSend(),
                              icon: const Icon(Icons.send_rounded, color: Colors.blue, size: 28)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
