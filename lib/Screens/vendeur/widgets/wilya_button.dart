import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math' as math;

import '../../../constant.dart';

class WilayaButton extends StatefulWidget {
  const WilayaButton({
    Key? key,
    required this.items,
    required this.hint,
  }) : super(key: key);
  final String hint;
  final items;

  @override
  State<WilayaButton> createState() => _WilayaButtonState();
}

class _WilayaButtonState extends State<WilayaButton> {
  String? currentValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20, right: 8),
            filled: true,
            fillColor: kPrimaryColor.withOpacity(0.1),
          ),
          hint: Text(widget.hint),
          alignment: Alignment.center,
          isDense: true,
          isExpanded: true,
          icon: Padding(
            padding:
                const EdgeInsets.only(left: 2.0, top: 3, right: 0, bottom: 0),
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
          items: widget.items is List<Map<String, dynamic>>
              ? widget.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                        child: Text(
                          e["name"],
                        ),
                        value: e["name"]),
                  )
                  .toList()
              : widget.items
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                        child: Text(
                          e,
                        ),
                        value: e),
                  )
                  .toList(),

          validator: (value) => widget.hint == "Wilaya"
              ? value == null
                  ? "Entrez une valeur"
                  : null
              : null,

          onChanged: (newValue) {
            setState(() {
              currentValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
