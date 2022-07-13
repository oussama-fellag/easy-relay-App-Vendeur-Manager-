import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed:() {},
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.h_mobiledata_rounded,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
