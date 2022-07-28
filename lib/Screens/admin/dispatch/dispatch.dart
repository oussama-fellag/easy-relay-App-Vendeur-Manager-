import 'package:flutter/material.dart';
import 'package:test12/Screens/login%20admin/login_screen_admin.dart';
import 'package:test12/Screens/vendeur/menu/commandes/liste_commandes.dart';
import 'package:test12/constant.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../vendeur/menu/commandes/tournee_widget.dart';
import '../../global widgets/bottom_button.dart';
import 'widgets/chercher_livreur_input.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class Dispatch extends StatefulWidget {
  const Dispatch({Key? key}) : super(key: key);

  @override
  State<Dispatch> createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  String _scanBarcode = 'Unkown';
  bool visible = false;
  void onTap() {
    setState(() {
      visible = true;
    });
  }

  Future playLocalAsset() async {
    String audioasset = "myCustomSoundEffect.mp3";

    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource(audioasset));
  }

  Stream<dynamic> startBarcodeScanStream() {
    return FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Terminer', true, ScanMode.BARCODE)!;
    //   .listen((barcode) => print(barcode),);
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  updateWidgets(String barcode) {
    if (mounted) {
      super.setState(() {
        playLocalAsset();

        widgets.add(TourneeWidget(
          barcode: barcode,
          commande: commande1,
        ));
      });
    }
  }

  List<Widget> widgets = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var subscription;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomButton(
        text: "confirmer",
        onTap: onTap,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.logout,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const LoginScreenAdmin())));
          },
        ),
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                icon: const Icon(
                  Icons.qr_code_2_rounded,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  subscription = startBarcodeScanStream().listen((event) {
                    updateWidgets(event);
                  });
                }),
          )),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Dispatch",
          style: TextStyle(color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const ChercherLivreur(),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView(
                  children: widgets,
                ),
              ),
              Visibility(
                  visible: visible,
                  child: TourneeWidget(
                    barcode: _scanBarcode,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
