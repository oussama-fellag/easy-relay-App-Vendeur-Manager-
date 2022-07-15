import 'package:flutter/material.dart';

import '../../constants.dart';


class LoginScreenTopImageNext extends StatelessWidget {
  const LoginScreenTopImageNext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: defaultPadding * 1.3),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 1,
              child: Image.asset("assets/images/signup.png"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}