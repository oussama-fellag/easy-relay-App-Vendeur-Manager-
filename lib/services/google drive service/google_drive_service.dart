import 'dart:typed_data';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:image_picker/image_picker.dart';

class GoogleDriveService {
  Future uploadTodrive(XFile file) async {
    final _googleSignIn =
        GoogleSignIn(scopes: ["https://www.googleapis.com/auth/drive"]);
    await _googleSignIn.signIn().catchError((error) {
      print(error);
    });
    var httpClient = (await _googleSignIn.authenticatedClient())!;
    var driveApi = DriveApi(httpClient);
    Uint8List firstList = await file.openRead().first;
    Stream<List<int>> strm = Stream.value(List<int>.from(firstList));
    var stt = strm.asBroadcastStream();

    await driveApi.files
        .create(File(), uploadMedia: Media(stt, firstList.length));
  }
}
