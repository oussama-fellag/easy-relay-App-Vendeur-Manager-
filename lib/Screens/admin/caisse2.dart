import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/cloudbuild/v1.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:image_picker/image_picker.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:test12/constant.dart';

import '../../bloc/scan_colis_bloc.dart';
import '../../bloc/vendeur_bloc.dart';
import '../../services/google drive service/google_drive_service.dart';
import '../global widgets/bottom_button.dart';
import '../vendeur/widgets/wilya_button.dart';
import 'Solde_Caisse.dart';



class Caisse2 extends StatefulWidget {
  const Caisse2({Key? key}) : super(key: key);

  @override
  State<Caisse2> createState() => _CaisseState();
}


XFile? _photo;
final ImagePicker _picker = ImagePicker();
class _CaisseState extends State<Caisse2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  BottomButton(
        text: "Ajouter ",
        onTap: AjoutDialog,
      ),
      appBar:AppBar(
        title: Text("Pret Inter Caisse "),
        backgroundColor: kPrimaryColor,
      ),

      body: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: const Text(
                    "Transaction",
                    style: TextStyle(
                        fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText:  "Montant*"),

                  validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
                ),


                const SizedBox(
                  height: 20,
                ),

                WilayaButton(items: [
                  A,
                  B,
                  C,
                ], hint: "Caisse emetrice"),
                const SizedBox(
                  height: 20,
                ),
                WilayaButton(items: [
                  A,
                  B,
                  C,
                ], hint: "Caisse receptrice"),
                SizedBox(height: 15,),
                WilayaButton(items: [
                  "Oussama Fellag",
                  "Abdelhak Razi",
                  "autre",
                ], hint: "Admin recepteur"),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(hintText: "Commentaire"),

                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  label: const Text(' Selectioner une photo'),
                  icon: const Icon(Icons.upload),
                  onPressed: () async {

                    _showPicker(context);
                  },
                ),


              ],
            ),
          )
      ),
    );


  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // setState(() {
    if (pickedFile != null) {
      _photo = pickedFile;
      /*BlocProvider.of<ImageBloc>(context)
          .add(UploadImage(pickedImage: pickedFile));*/
    } else {}
    //});
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _photo = pickedFile;
      /* BlocProvider.of<ImageBloc>(context)
          .add(UploadImage(pickedImage: pickedFile));*/
    } else {
      print('No image selected.');
    }
    // });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () async {
                      await imgFromGallery();
                      Navigator.of(context).pop();
                      await GoogleDriveService().uploadTodrive(_photo!);
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    await imgFromCamera();
                    Navigator.of(context).pop();
                    await GoogleDriveService().uploadTodrive(_photo!);
                  },
                ),
              ],
            ),
          );
        });
  }


  AjoutDialog() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Vous voulez confirmer votre choix'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'non'),
            child: const Text('non'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Oui'),
            child: const Text('Oui'),
          ),
        ],
      ),
    );
  }



}
