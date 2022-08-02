import 'package:flutter/material.dart';
import 'package:test12/Screens/admin/menu/menu_admin.dart';
import 'package:test12/Screens/login%20admin/login_form_admin.dart';

import '../../../constant.dart';
import '../../global widgets/bottom_button.dart';
import 'Profil.dart';
import 'testScreen.dart';

int index = email.indexOf('@');
String Username = email.substring(0, index);
String phone = " / ccccccc";

final nomController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();

class EditProfil extends StatelessWidget {
  const EditProfil({Key? key}) : super(key: key);

  void onTap() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BottomButton(
          text: "enregistrer",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ProfilePage1())));
          },
        ),
        body: Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                " modifier le profile",
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "  nom complet",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Nom & prenom"),
              validator: (value) =>
                  value!.isEmpty ? "Entrez une valeur" : Username,
              controller: nomController,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "  email",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "email"),
              validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
              controller: emailController,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "  Numero de telephone",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Prénom"),
              validator: (value) =>
                  value!.isEmpty ? "Entrez une valeur" : phone,
              controller: phoneController,
            )
          ]),
        ));
  }
}

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class TopPortion extends StatelessWidget {
  const TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/user5.jpg')),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
