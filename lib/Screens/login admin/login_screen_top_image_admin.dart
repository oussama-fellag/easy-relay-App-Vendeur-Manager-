import 'package:flutter/material.dart';

import '../../constants.dart';


class LoginScreenTopImageAdmin extends StatelessWidget {
  const LoginScreenTopImageAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to Admin login ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding * 1.3),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 5,
              child: Image.asset("assets/images/admin.png"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}