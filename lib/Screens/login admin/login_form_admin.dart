import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/admin/menu/menu_admin.dart';
import 'package:test12/bloc/livreur_bloc.dart';
import 'package:test12/main.dart';

import '../../constants.dart';
import '../../models/models.dart';
import '../../services/authentication.dart';
import '../admin/profil_admin/testScreen.dart';

String email = " ";
String email1 = "gggggggg ";

class LoginFormAdmin extends StatelessWidget {
  LoginFormAdmin({
    Key? key,
  }) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xFF6F35A5),
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "mot de passe",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Hero(
            tag: "login_btn",
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  /* Compte compte = Compte(
                      email: emailController.text,
                      password: passwordController.text);
                  var status = await Authentication().adminLogin(compte);
                  if (status != '') {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error authentication'),
                        content: Text(status),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {*/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider<LivreurBloc>(
                              create: (context) => LivreurBloc(
                                  compte: Compte(
                                      email: "zaki.m@easy-relay.com",
                                      password: "1234")),
                              child: const ScreenMenu())));
                  //  email = compte.email;
                  email = "zaki.m@easy-relay.com";
                  // email.replaceAll(email, em);
                },
                //},
                child: Text(
                  "Connecter".toUpperCase(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Text("Vous êtes un Nouveau Vendeur? ",
                    style: TextStyle(color: kPrimaryColor)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AfterSplash();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Tappez ici",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
