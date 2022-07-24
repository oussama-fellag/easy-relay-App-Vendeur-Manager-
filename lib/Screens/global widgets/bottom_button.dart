import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, -3),
            color: Colors.black.withOpacity(0.05)),
      ]),
      child: ElevatedButton(
          child: Text(
            text.toUpperCase(),
          ),
          onPressed: () {
            onTap!();
          }),
    );
  }
}
