import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';

import 'signUp_form_next.dart';
import 'signUp_screen_top_image_next.dart';

class LoginScreenNext extends StatelessWidget {
  const LoginScreenNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImageNext(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginFormNext(),
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
        const LoginScreenTopImageNext(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginFormNext(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
