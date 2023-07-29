import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 40,
            ),
            Text('Chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        
        itemBuilder: (context, index) {
        return ChatBuble();
      }),
    );
  }
}
