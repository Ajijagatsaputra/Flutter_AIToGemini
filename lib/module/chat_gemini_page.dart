import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai/module/chat_gemini_notifier.dart';
import 'package:provider/provider.dart';

class ChatGeminiPage extends StatelessWidget {
  const ChatGeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatGeminiNotifier(context: context),
      child: Consumer<ChatGeminiNotifier>(
        builder: (context, value, child) => Scaffold(
          body: DashChat(
            currentUser: value.currrentUser,
            onSend: value.sendMessage,
            messages: value.listMessage,
          ),
        ),
      ),
    );
  }
}
