import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test12/constant.dart';

import '../../services/google drive service/google_drive_service.dart';

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
      body: Center(
          child: ElevatedButton(
        child: Text("Google Drive Test"),
        onPressed: () async {
          _showPicker(context);
        },
      )),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Caisse test"),
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
}
