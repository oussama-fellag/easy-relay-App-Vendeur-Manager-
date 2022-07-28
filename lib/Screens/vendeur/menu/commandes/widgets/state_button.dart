import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../../../../constant.dart';

class StateButton extends StatefulWidget {
  const StateButton({
    Key? key,
    required this.items,
  }) : super(key: key);
  final items;

  @override
  State<StateButton> createState() => _StateButtonState();
}

class _StateButtonState extends State<StateButton> {
  String currentValue = "En attente";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 8, right: 8),
            filled: true,
            fillColor: kPrimaryColor.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          isDense: true,
          iconSize: 16,
          icon: Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3),
            child: Transform.rotate(
                angle: math.pi / 2,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 16,
                )),
          ),
          style: const TextStyle(color: Colors.black),
          dropdownColor: Colors.white,

          //isDense: true,
          value: currentValue,
          items: widget.items
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem<String>(
                    child: Text(
                      e,
                    ),
                    value: e),
              )
              .toList(),

          onChanged: (newValue) {
            setState(() {
              currentValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
