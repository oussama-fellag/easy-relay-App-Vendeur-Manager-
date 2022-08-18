import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/menu/menu_vendeur.dart';
import 'package:test12/constant.dart';
import '../../../../main.dart';
import '../../../global widgets/bottom_button.dart';
import '../../widgets/wilya_button.dart';

class SignalerIncident extends StatelessWidget {
  SignalerIncident({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: buildDrawer(context),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          title: const Text("Signaler un incident"),
          //style: TextStyle(color: kPrimaryColor)),
          /*  leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: kPrimaryColor,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
          ),*/
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const BottomButton(
          text: "Envoyer",
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Les informatons Du Ticket",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Email:",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      maxLines: 1,
                      decoration: const InputDecoration(hintText: "Email"),
                      initialValue: "Oussama.flg@gmail.com"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Titre & Type du ticket:",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(

                          child: TextFormField(
                            maxLines: 1,
                            decoration:  InputDecoration(
                              hintText: "Titre",
                            ),
                          ),
                        ),
                      ),
                       Spacer(),
                      const Flexible(
                        child: WilayaButton(items: [
                          'Question',
                          'Problème',
                          'Incident',
                          'Demande'
                        ], hint: "type"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(hintText: "Id commande"),

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(hintText: "Description*"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer une valeur';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    label: const Text('Joindre fichier'),
                    icon: const Icon(Icons.upload),
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
                    },
                  ),
                ],
              ),
            )));
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
// Add a ListView to the drawer. This ensures the user can scroll
// through the options in the drawer if there isn't enough vertical
// space to fit everything.
      child: ListView(
// Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('oussama fellag'),
            accountEmail: const Text('oussama.flg@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 1,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/user3.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF6F35A5),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/nature.jpg'),
              ),
            ),
          ),
          ListTile(
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Text('Accueil', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ScreenMenuVendeur())));
            },
          ),
          ListTile(
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Text('Signaler un incident',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => SignalerIncident())));
            },
          ),
          ListTile(
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Text('Déconnecter',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AfterSplash())));
            },
          ),
          /*ListTile(
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
// Icon(Icons.local_shipping_sharp, color: Colors.black,),
                Text('    item2',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {},
          ),*/
        ],
      ),
    );
  }
}
