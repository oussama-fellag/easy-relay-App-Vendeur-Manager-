import 'package:flutter/material.dart';
import 'package:test12/Screens/dispatch/tournee_widget.dart';
import 'package:test12/constant.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Dispatch extends StatefulWidget {
  const Dispatch({Key? key}) : super(key: key);

  @override
  State<Dispatch> createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  var livreurs = [];
  var searchResult = [
    "Abdelhak Razi",
    "Oussama fellag",
    "Nada",
    "Zaki",
    "Samir amine"
  ];
  String _scanBarcode = 'Unkown';
  bool visible = false;
  @override
  void initState() {
    super.initState();
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  TextEditingController textController = TextEditingController();
  FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
            child: Text(
              'confirmer'.toUpperCase(),
              //style: const TextStyle(color: kPrimaryColor),
            ),
            onPressed: () {}),
      ),
      appBar: AppBar(
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: /*Text(
              "Suivant".toUpperCase(),
              style: const TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),*/
                IconButton(
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Résultat du scan',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _scanBarcode,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 123, 123, 123),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                          color: Colors.black.withOpacity(0.1)),
                    ]),
                child: TextFormField(
                    autofocus: true,
                    focusNode: node,
                    controller: textController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Affecter un livreur",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        livreurs = searchResult.where((element) {
                          final result = element.toLowerCase();
                          final input = value.toLowerCase();
                          return result.contains(input);
                        }).toList();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !visible,
                child: Expanded(
                  child: ListView.builder(
                      itemCount: livreurs.length,
                      itemBuilder: ((context, index) {
                        if (index % 2 == 0) {
                          return ListTile(
                            title: Text(livreurs[index]),
                            onTap: () async {
                              setState(() {
                                node.unfocus();

                                textController.text = livreurs[index];
                                livreurs = [];
                                visible = true;
                              });
                            },
                          );
                        } else {
                          return const Divider(
                            thickness: 2,
                          );
                        }
                      })),
                ),
              ),
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
