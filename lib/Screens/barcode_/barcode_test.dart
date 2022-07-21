import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Scan barcode"),
              onPressed: () async {
                String barcodeScanRes;

                try {
                  barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                      '#ff6666', 'Cancel', true, ScanMode.BARCODE);
                  print(barcodeScanRes);
                  print("wa sar7ona");
                } on PlatformException {
                  barcodeScanRes = 'Failed to get platform version.';
                }

                // If the widget was removed from the tree while the asynchronous platform
                // message was in flight, we want to discard the reply rather than calling
                // setState to update our non-existent appearance.
                if (!mounted) return;

                print(barcodeScanRes);
                print("hello");
              },
            ),
          ],
        ),
      ),
    );
  }
}
