import 'package:eduai_frontend/core/constants/gradient.dart';
import 'package:eduai_frontend/core/widgets/chat_input_bar.dart';
import 'package:eduai_frontend/core/widgets/shadder_mask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_view_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatViewModel(),
      child: const _ChatScreen(),
    );
  }
}

class _ChatScreen extends StatelessWidget {
  const _ChatScreen();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat with EduAI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔹 CHAT LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vm.messages.length + (vm.isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (vm.isTyping && index == vm.messages.length) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: ShadderMask2(widget: const Text("EduAI is typing...",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15,color: Colors.white),)),
                  );
                }

                final message = vm.messages[index];
                final isUser = message.isUser;

                return Align(
                  alignment:
                  isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    constraints: const BoxConstraints(maxWidth: 280),
                    decoration: BoxDecoration(
                      // color: isUser
                      //     ? Colors.blueAccent
                      //     : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(14),
                      gradient: isUser
                        ? gradient2
                        : gradient3
                    ),
                    child: Text(
                      message.message,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),


          ChatInputBar(
            controller: controller,
            onPressed: (){
              vm.sendMessage(controller.text);
              controller.clear();
            },
          )
        ],
      ),
    );
  }
}
