import 'package:flutter/material.dart';
import 'package:test12/Screens/vendeur/menu/menu_vendeur.dart';
import 'package:test12/constant.dart';

import '../../../../main.dart';
import '../../../global widgets/bottom_button.dart';

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
          title: Text("Signaler un incident"),
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
          text: "signaler",
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Décrire le probléme que vous avez rencontrez",
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: "Description"),
                ),
              ],
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
            accountName: Text('oussama fellag'),
            accountEmail: Text('oussama.flg@gmail.com'),
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
