import 'package:flutter/material.dart';
import 'package:test12/Screens/dispatch/tournee_widget.dart';
import 'package:test12/constant.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../global widgets/bottom_button.dart';
import 'widgets/chercher_livreur_input.dart';

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

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomButton(
        text: "confirmer",
        onTap: onTap,
      ),
      appBar: AppBar(
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                icon: const Icon(
                  Icons.qr_code_2_rounded,
                  color: kPrimaryColor,
                ),
                onPressed: () => scanBarcodeNormal()),
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
              Visibility(
                  visible: visible,
                  child: TourneeWidget(
                    barcode: _scanBarcode,
                    livreur: '',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
