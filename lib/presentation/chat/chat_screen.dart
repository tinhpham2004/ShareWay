import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/widgets/bottom_navigation/bottom_navigation.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigation(initialIndex: 2),
      body: Center(
        child: Text(
          'Chat Screen',
        ),
      ),
    );
  }
}
