import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBuble extends StatelessWidget {
  String text = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        // height:50,
        // width: 150,
        padding: EdgeInsets.only(left: 20, top: 25, bottom: 25, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          'i am zahra ali',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
