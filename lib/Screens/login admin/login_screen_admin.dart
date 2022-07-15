import 'package:flutter/material.dart';


import '../../components/background.dart';
import '../../responsive.dart';

import 'login_form_admin.dart';
import 'login_screen_top_image_admin.dart';
class LoginScreenAdmin extends StatelessWidget {
  const LoginScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImageAdmin(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: LoginFormAdmin(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImageAdmin(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginFormAdmin(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
