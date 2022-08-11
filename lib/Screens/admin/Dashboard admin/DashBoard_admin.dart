import 'package:flutter/material.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        children: <Widget>[
          Text('hi'),
          Text('hi'),
          Text('hi'),
        ]
    )
),
    );
  }
}
