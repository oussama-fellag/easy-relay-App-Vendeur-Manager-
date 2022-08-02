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
        const Text(
          "Connexion Manager",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: kPrimaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
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
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
