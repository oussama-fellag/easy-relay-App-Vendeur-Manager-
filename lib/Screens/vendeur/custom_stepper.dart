import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 7.5),
              child: Row(
                  children: List.generate(2,
                      (index) => _buildDivider(currentIndex > index, index))),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                      tag: 'first',
                      child: CircleStep(index: 0, currentIndex: currentIndex)),
                  Column(
                    children: [
                      Hero(
                          tag: 'second',
                          child:
                              CircleStep(index: 1, currentIndex: currentIndex)),
                    ],
                  ),
                  Hero(
                      tag: 'third',
                      child: CircleStep(index: 2, currentIndex: currentIndex))
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Client",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "Commande",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            const Align(
              alignment: Alignment(0, 0),
              child: Text(
                "Livraison",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Flexible _buildDivider(bool selected, int index) {
    return Flexible(
      child: Hero(
        tag: index,
        child: Divider(
          color: selected ? kPrimaryColor : kPrimaryColor.shade200,
          thickness: 4,
        ),
      ),
    );
  }
}

class CircleStep extends StatelessWidget {
  const CircleStep({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 15,
        backgroundColor:
            currentIndex >= index ? kPrimaryColor : kPrimaryColor.shade200,
        child: buildResult());
  }

  Widget? buildResult() {
    if (currentIndex > index) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      );
    }
    if (currentIndex == index) {
      return Text(
        (index + 1).toString(),
        style: const TextStyle(fontSize: 12, color: Colors.white),
      );
    } else {
      return null;
    }
  }
}
