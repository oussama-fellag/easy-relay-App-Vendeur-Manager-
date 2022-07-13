import 'package:flutter/material.dart';


import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WELCOME TO EASY RELAY SELLER PAGE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height:  17),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child:Image.asset("assets/images/easy_relay.jpg"),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 88),
      ],
    );
  }
}
//TODO: dshyudeuwgdutewdtye