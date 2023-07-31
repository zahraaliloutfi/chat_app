import 'package:chat_application/constants.dart';

class Message {
  final  message;
  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData![kMessages]);
  }
}
