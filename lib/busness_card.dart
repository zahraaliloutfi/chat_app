import 'package:flutter/material.dart';

class BusnessCardApp extends StatelessWidget {
  const BusnessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274460),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 92,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 90,
                backgroundImage: NetworkImage(
                    'https://cdn2.iconfinder.com/data/icons/flat-pack-1/64/Female-1024.png'),
              ),
            ),
            const Text(
              'Zahra Ali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            const Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 0.6,
              height: 10,
              color: Colors.grey,
              indent: 40,
              endIndent: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 10,
                top: 2,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 58,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 11,
                      ),
                      child: Icon(
                        Icons.phone,
                        size: 32,
                        color: Color(0xFF274460),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 11,
                      ),
                      child: Text(
                        '(+20) 0110293847377',
                        style: TextStyle(
                          color: Color(0xFF274460),
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 65,
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: const ListTile(
                    leading: Icon(
                      Icons.mail,
                      size: 32,
                      color: Color(0xFF274460),
                    ),
                    title: Text(
                      'zahra@gmail.com',
                      style: TextStyle(
                        color: Color(0xFF274460),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
