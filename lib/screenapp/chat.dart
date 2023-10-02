import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messages = <ChatMessage>[];

  void _handleSend(String text) {
    // Send message
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
            const Icon(Icons.account_circle_rounded, size: 50, color: Colors.black),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alex Robin",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            Text("Active", style: TextStyle(fontSize: 10, color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];

                    return ChatBubble(
                      text: message.text,
                      isUser: message.isUser,
                    );
                  })),
          ChatInput(onSend: _handleSend),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(90, 0, 0, 10),
      decoration: BoxDecoration(
        color: isUser ? Colors.blue : Colors.grey[300],
        borderRadius: isUser
            ? const BorderRadius.only(topLeft: Radius.circular(19))
            : const BorderRadius.only(topRight: Radius.circular(19)),
      ),
      child: Text(text),
    );
  }
}

class ChatInput extends StatefulWidget {
  final ValueChanged<String> onSend;

  const ChatInput({super.key, required this.onSend});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _textController = TextEditingController();

  void _handleSubmitted(String text) {
    widget.onSend(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.mic),
                hintText: 'Type message',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(color: Colors.blue, width: 2))),
          )),
        ],
      ),
    );
  }
}
