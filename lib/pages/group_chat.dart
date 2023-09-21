import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class GroupChatScreen extends StatefulWidget {
  static String id = 'GroupChatPage';
  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  String _messageText = '';

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        _user = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendMessage() async {
    if (_messageText.isNotEmpty) {
      try {
        await _firestore.collection('messages').add({
          'text': _messageText,
          'sender': _user.email,
          'timestamp': FieldValue.serverTimestamp(),
        });
        // Clear the text field after sending the message
        setState(() {
          _messageText = '';
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Group Chat App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('messages')
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final messages = snapshot.data?.docs.reversed;
              List<MessageBubble> messageWidgets = [];
              for (var message in messages!) {
                final messageText = message['text'];
                final messageSender = message['sender'];
                final currentUser = _user.email;

                final messageBubble = MessageBubble(
                  text: messageText,
                  sender: messageSender,
                  isMe: currentUser == messageSender,
                );

                messageWidgets.add(messageBubble);
              }
              return Expanded(
                child: ListView(
                  reverse: true,
                  children: messageWidgets,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _messageText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
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

class MessageBubble extends StatelessWidget {
  final String? text;
  final String? sender;
  final bool? isMe;

  MessageBubble({this.text, this.sender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender!,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: isMe! ? kPrimaryColor : Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe! ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
