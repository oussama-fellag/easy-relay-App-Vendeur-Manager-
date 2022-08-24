import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/login%20admin/login_screen_admin.dart';
import 'package:test12/bloc/scan_colis_bloc.dart';
import 'package:test12/constant.dart';

import 'package:test12/screens/admin/reception_navette/navette_component.dart';
import '../../global widgets/bottom_button.dart';

class ReceptionNavette extends StatefulWidget {
  const ReceptionNavette({Key? key}) : super(key: key);

  @override
  State<ReceptionNavette> createState() => _ReceptionNavetteState();
}

class _ReceptionNavetteState extends State<ReceptionNavette> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomButton(
        text: "receptionner",
        onTap: receptionDialog,
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
                  BlocProvider.of<ScanColisBloc>(context).add(CommencerScan());
                }),
          )),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Reception Navette",
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
              Flexible(
                child: BlocBuilder<ScanColisBloc, ScanColisState>(
                    builder: (context, state) {
                  return state is ColisPret
                      ? ListView.builder(
                          itemCount: state.colis.length,
                          itemBuilder: (ctx, index) {
                            return NavetteComponent(
                                barcode: state.colis[index]);
                          })
                      : const SizedBox();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  receptionDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Confirmation"),
              content: const Text("Voulez vous receptionner des colis?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      BlocProvider.of<ScanColisBloc>(context)
                          .add(ConfirmerReception());
                    },
                    child: const Text("Oui")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Non",
                      style: TextStyle(color: kPrimaryColor),
                    ))
              ],
            ));
  }
}
