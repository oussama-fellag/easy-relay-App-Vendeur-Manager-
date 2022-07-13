import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

final List<Map<String, dynamic>> _items = [
  {
    'value': 'Manager',
    'label': 'Manager',
    'icon': Icon(Icons.person),
  },
  {
    'value': 'vendeur',
    'label': 'Vendeur',
    'icon': Icon(Icons.person),
    'textStyle': TextStyle(color: Colors.red),
  },

];

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // type vendeur , manager dans ce champs
        SelectFormField(
        type: SelectFormFieldType.dropdown, // or can be dialog


        labelText: 'type',
        items: _items,
        onChanged: (val) => print(val),
        onSaved: (val) => print(val),
       ),
          SizedBox(height: 10),
          //nom dans ce champs
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (nom) {},
            decoration: InputDecoration(
              hintText: "First name",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.account_box_rounded),
              ),
            ),
          ),
          SizedBox(height: 10),
          // prenom dans ce champs
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (prenom) {},
            decoration: InputDecoration(
              hintText: "Last name",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 10),
          //email dans ce champs
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            // password dans ce champs
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

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
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