import 'package:flutter/material.dart';
import 'package:test12/Screens/login%20admin/login_form_admin.dart';
import 'edit_profile.dart';

String em = emailController.text;

//email.replaceAll(email, em);
class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(em));
  }
}
