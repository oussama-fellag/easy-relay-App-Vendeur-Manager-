import 'package:flutter/material.dart';

import '../../components/already_have_an_account_acheck.dart';
import '../../constant.dart';
import '../../constants.dart';


class LoginFormNext extends StatelessWidget {
  const  LoginFormNext
      ({
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
        cursorColor: Color(0xFF6F35A5),
        onSaved: (nom_vendeur) {},
    decoration: InputDecoration(
    hintText: "nom boutique",
    prefixIcon: Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Icon(Icons.shop_2),
    ),
    ),
    ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Color(0xFF6F35A5),
            onSaved: (adresse) {},
            decoration: InputDecoration(
              hintText: "adresse",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.shop_2),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Color(0xFF6F35A5),
            onSaved: (commune_id) {},
            decoration: InputDecoration(
              hintText: "commune",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.shop_2),
              ),
            ),
          ),
          SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
    child: TextFormField(
    textInputAction: TextInputAction.done,
    obscureText: true,
    cursorColor:Color(0xFF6F35A5) ,
    decoration: InputDecoration(
    hintText: "Your password",
    prefixIcon: Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Icon(Icons.lock),
    ),
    ),
    ),
    ),
    const SizedBox(height: 5),

    Hero(
    tag: "login_btn",
    child: ElevatedButton(
    onPressed: () {},
    child: Text(
    "Login".toUpperCase(),
    ),
    ),
    ),
    SizedBox(height: 20),


        ],
        ),
    );
  }
}



