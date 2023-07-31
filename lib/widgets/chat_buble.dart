import 'package:flutter/material.dart';
import '../constants.dart';

class ChatBuble extends StatelessWidget {
  String text = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy';

  ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: double.maxFinite,
            color: kPrimaryColor,
            child: const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'i am zahra ali',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
        // Container(
        //   // height:50,
        //   // width: 150,
        //   padding:
        //       const EdgeInsets.only(left: 20, top: 25, bottom: 25, right: 16),
        //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(23),
        //       topRight: Radius.circular(23),
        //       bottomRight: Radius.circular(23),
        //     ),
        //     color: kPrimaryColor,
        //   ),
        //   child: const Text(
        //     'i am zahra ali',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        );
  }
}
