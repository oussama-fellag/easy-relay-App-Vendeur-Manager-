import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:image_picker/image_picker.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:test12/constant.dart';

import '../../bloc/vendeur_bloc.dart';
import '../../services/google drive service/google_drive_service.dart';
import '../global widgets/bottom_button.dart';

class Caisse extends StatefulWidget {
  const Caisse({Key? key}) : super(key: key);

  @override
  State<Caisse> createState() => _CaisseState();
}

XFile? _photo;
final ImagePicker _picker = ImagePicker();

class _CaisseState extends State<Caisse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text("Caisse"),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BottomButton(
        text: "effectuer la transaction",
      ),
      body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "  Renseignements de Transaction",
                style: TextStyle(
                    fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText:  "Code*"),

                validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(hintText:  "Nom compleet*"),

                validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
              ),
              const SizedBox(
                height: 20,
              ),

              TextFormField(
                decoration: InputDecoration(hintText:  "mail*"),

                validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              NumberInputPrefabbed.roundedButtons(
                incDecBgColor: kPrimaryLightColor,
                separateIcons: true,
                decIconColor: kPrimaryColor,
                incIconColor: kPrimaryColor,
                textAlign: TextAlign.left,
                controller: BlocProvider.of<VendeurBloc>(context).quantite,
                onChanged: (newValue) => newValue == 0 ? "Entrez une valeur" : null,
                // validator: (value) => value == "0" ? "Entrez une valeur" : null,
                max: 100,
                enabled: true,
                numberFieldDecoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Nombre de designation",
                    hintText: "Quantité",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    filled: true,
                    fillColor: kPrimaryColor.withOpacity(0.1),
                    iconColor: kPrimaryColor,
                    prefixIconColor: kPrimaryColor,

                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "  Preuve de Transaction (Format Image):",
                style: TextStyle(
                  fontSize: 15, color: kPrimaryColor, ),
              ),
              SizedBox(height: 10,),
              ElevatedButton.icon(
                label: const Text(' Selectioner une photo'),
                icon: const Icon(Icons.upload),
                onPressed: () async {

                 _showPicker(context);
                },
              ),

            ],
          )
      ),
    );















//
//       Scaffold(
//       body:
//
//
//
//
//
//
//
//
//
//
//       Center(
//           child: ElevatedButton(
//         child: Text("Google Drive Test"),
//         onPressed: () async {
//           _showPicker(context);
//         },
//       )),
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         title: const Text("Caisse test"),
//       ),
//     );
//   }
//
//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     // setState(() {
//     if (pickedFile != null) {
//       _photo = pickedFile;
//       /*BlocProvider.of<ImageBloc>(context)
//           .add(UploadImage(pickedImage: pickedFile));*/
//     } else {}
//     //});
//   }
//
//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       _photo = pickedFile;
//       /* BlocProvider.of<ImageBloc>(context)
//           .add(UploadImage(pickedImage: pickedFile));*/
//     } else {
//       print('No image selected.');
//     }
//     // });
//   }
//
//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                     leading: const Icon(Icons.photo_library),
//                     title: const Text('Gallery'),
//                     onTap: () async {
//                       await imgFromGallery();
//                       Navigator.of(context).pop();
//                       await GoogleDriveService().uploadTodrive(_photo!);
//                     }),
//                 ListTile(
//                   leading: const Icon(Icons.photo_camera),
//                   title: const Text('Camera'),
//                   onTap: () async {
//                     await imgFromCamera();
//                     Navigator.of(context).pop();
//                     await GoogleDriveService().uploadTodrive(_photo!);
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
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
 }}
