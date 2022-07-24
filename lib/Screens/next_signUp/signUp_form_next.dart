import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test12/Screens/vendeur/ajouter_commande.dart';
import 'package:test12/services/authentication.dart';

import '../../constants.dart';
import '../../providers/vendeur_provider.dart';

class LoginFormNext extends StatelessWidget {
  LoginFormNext({
    Key? key,
  }) : super(key: key);
  TextEditingController nomController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController communeController = TextEditingController();
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: nomController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: const Color(0xFF6F35A5),
            onSaved: (nom_vendeur) {},
            decoration: const InputDecoration(
              hintText: "nom boutique",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.shop_2),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: adresseController,
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
            controller: communeController,
            keyboardType: TextInputType.number,
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
          const SizedBox(height: 10),
          TextFormField(
            controller: num1Controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {},
            decoration: const InputDecoration(
              hintText: "num1",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.phone),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: num2Controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (num2) {},
            decoration: const InputDecoration(
              hintText: "num2",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.phone),
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
                  Provider.of<VendeurProvider>(context, listen: false)
                      .secondPart(
                          adresse: adresseController.text,
                          communeId: int.parse(communeController.text),
                          nom: nomController.text,
                          num1: int.parse(num1Controller.text),
                          num2: int.parse(num2Controller.text));
                  print(Provider.of<VendeurProvider>(context, listen: false)
                      .vendeur
                      .communeId);
                  var status = await Authentication().vendeurCreation(
                      Provider.of<VendeurProvider>(context, listen: false)
                          .vendeur);
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
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AjouterCommande(),
                        ));
                  }
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
