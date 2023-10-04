// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rescuetrack/screens/homepage.dart';

class ChatMessage {
  final String content;
  final DateTime timestamp;

  ChatMessage(this.content, this.timestamp);
}

class ChatPage extends StatefulWidget {
  final CardData cardData;

  ChatPage({required this.cardData});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  void _sendMessage(String message) {
    setState(() {
      final currentTime = DateTime.now();
      final chatMessage = ChatMessage(message, currentTime);
      _messages.add(chatMessage);
    });
  }

  void _handleMessageInput(String message) {
    if (message.isNotEmpty) {
      _sendMessage(message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chat'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = _messages[index];
              return ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 85, 85, 85), // You can use a different color for sent messages.
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(message.content,
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 4.0),
                      Text(
                        DateFormat('HH:mm').format(message.timestamp),
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Enter your message...",
                    ),
                    onSubmitted: _handleMessageInput,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () {
                    _handleMessageInput(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
