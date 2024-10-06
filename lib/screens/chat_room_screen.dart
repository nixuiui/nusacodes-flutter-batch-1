import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/widgets/left_bubble_chat.dart';
import 'package:flutter_nusacodes/widgets/right_bubble_chat.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  final chats = [
    "Hi, I'm Niki",
    "Hi, Good morning",
    "How do you do",
  ];

  final messageController = TextEditingController();

  void sendChat(String message) {
    setState(() {
      chats.add(message);
    });
    messageController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                  "https://assets.goal.com/images/v3/bltd58c4d60ecd9275e/GOAL_-_Blank_WEB_-_Facebook_-_2023-06-13T135350.847.png?auto=webp&format=pjpg&width=3840&quality=60",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Image.network(
                "https://assets.goal.com/images/v3/bltd58c4d60ecd9275e/GOAL_-_Blank_WEB_-_Facebook_-_2023-06-13T135350.847.png?auto=webp&format=pjpg&width=3840&quality=60",
                width: 50,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://assets.goal.com/images/v3/bltd58c4d60ecd9275e/GOAL_-_Blank_WEB_-_Facebook_-_2023-06-13T135350.847.png?auto=webp&format=pjpg&width=3840&quality=60",
                width: 20,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {}, 
            child: const Text('Elevated Button')
          ),
          ElevatedButton.icon(
            onPressed: () {}, 
            label: const Text('Elevated Button'),
            icon: const Icon(Icons.send),
          ),
          const SizedBox(height: 16,),
          FilledButton(
            onPressed: () {}, 
            child: const Text('Filled Button')
          ),
          FilledButton.icon(
            onPressed: () {}, 
            label: const Text('Elevated Button'),
            icon: const Icon(Icons.send),
          ),
          FilledButton.tonal(
            onPressed: () {}, 
            child: const Text('Tonal Button')
          ),
          FilledButton.tonalIcon(
            onPressed: () {}, 
            label: const Text('Elevated Button'),
            icon: const Icon(Icons.send),
          ),
          const SizedBox(height: 16,),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: chats.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8), 
            itemBuilder: (context, index) {
              if(index % 2 == 1) {
                return RightBubbleChat(chats[index]);
              } else {
                return LeftBubbleChat(chats[index]);
              }
            }, 
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  hintText: 'Ketik Pesan...',
                ),
              ),
            ),
            IconButton(
              onPressed: () => sendChat(messageController.text), 
              icon: const Icon(Icons.send)
            ),
          ],
        ),
      ),
    );
  }
}