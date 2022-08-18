import 'package:flutter/material.dart';
import '../../services/authentication.dart';
import '../../constants.dart';


class LoginScreenTopImageAdmin extends StatelessWidget {
  const LoginScreenTopImageAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
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
