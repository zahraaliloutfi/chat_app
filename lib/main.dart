import 'package:chat_application/pages/chat_page.dart';
import 'package:chat_application/pages/group_chat.dart';
import 'package:chat_application/pages/login_screen.dart';
import 'package:chat_application/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginPage': (context) => const LoginPage(),
        GroupChatScreen.id: (context) => GroupChatScreen(),
        ChatPage.id: (context) => ChatPage(),
        RegisterPage.id: (context) => const RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterPage.id,
    );
  }
}
