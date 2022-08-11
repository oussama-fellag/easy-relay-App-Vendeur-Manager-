import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test12/Screens/next_signUp/signUp_screen_next.dart';
import 'package:test12/providers/vendeur_provider.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../models/models.dart';
import '../../Login/login_screen.dart';

var _formKey = GlobalKey<FormState>();
void submit() {
  final isValid = _formKey.currentState?.validate();
  if (!isValid!) {
    return;
  }
  _formKey.currentState?.save();
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 10),
          //nom dans ce champs
          TextFormField(
            controller: nomController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (nom) {},
            decoration: const InputDecoration(
              hintText: "nom*",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.account_box_rounded),
              ),
            ),
            validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
          ),
          const SizedBox(height: 10),
          // prenom dans ce champs
          TextFormField(
            controller: prenomController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (prenom) {},
            decoration: const InputDecoration(
              hintText: "prenom*",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
          ),
          const SizedBox(height: 10),
          //email dans ce champs
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (emailVen) {},
            decoration: const InputDecoration(
              hintText: "email*",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
            validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: const Color(0xFF6F35A5),
              decoration: const InputDecoration(
                hintText: "mot de passe*",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<VendeurProvider>(context, listen: false).firstPart(
                    nomVendeur: nomController.text,
                    prenom: prenomController.text,
                    compte: Compte(
                        email: emailController.text,
                        password: passwordController.text));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreenNext();
                    },
                  ),
                );
              },
              child: Text("suivant".toUpperCase()),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Text("Vous avez deja un compte ? ",
                    style: TextStyle(color: kPrimaryColor)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
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
