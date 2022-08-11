import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../widgets/wilya_button.dart';

class DashboardVendeur extends StatelessWidget {
  const DashboardVendeur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Dashboard",
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Flexible(
                child: WilayaButton(
                    items: ["En cours", "Livrées", "Annulées", "En Retard"],
                    hint: "Filtrer"),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Rechercher une commande par ID..."),
            validator: (value) => value!.isEmpty ? "Entrez une valeur" : null,
          ),
          SizedBox(
            height: 35,
          ),
          Divider(
            thickness: 5, // thickness of the line
            indent: 2, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: kPrimaryColor, // The color to use when painting the line.
            height: 20, // The divider's height extent.
          ),
          Expanded(
            child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn(
                      label: Text(
                    "ID cmd",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                  DataColumn(
                      label: Text(
                    "Vendeur",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                  DataColumn(
                      label: Text(
                    "Type",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                  DataColumn(
                      label: Text(
                    "Client",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                  DataColumn(
                      label: Text(
                    "prix",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                  DataColumn(
                      label: Text(
                    "Wilaya",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kPrimaryColor),
                  )),
                ],
                rows: <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(Text("1")),
                    DataCell(Text("oussama")),
                    DataCell(Text("En cours")),
                    DataCell(Text("x")),
                    DataCell(Text("100000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("2")),
                    DataCell(Text("abdelhak")),
                    DataCell(Text("En cours")),
                    DataCell(Text("y")),
                    DataCell(Text("10000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("3")),
                    DataCell(Text("abdelhak")),
                    DataCell(Text("Livrées")),
                    DataCell(Text("y")),
                    DataCell(Text("10000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("4")),
                    DataCell(Text("oussama")),
                    DataCell(Text("Livrées")),
                    DataCell(Text("x")),
                    DataCell(Text("10000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("5")),
                    DataCell(Text("abdelhak")),
                    DataCell(Text("En cours")),
                    DataCell(Text("y")),
                    DataCell(Text("10000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("6")),
                    DataCell(Text("abdelhak")),
                    DataCell(Text("Annulées")),
                    DataCell(Text("y")),
                    DataCell(Text("100000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("7")),
                    DataCell(Text("oussama")),
                    DataCell(Text("En Retard")),
                    DataCell(Text("x")),
                    DataCell(Text("10000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("8")),
                    DataCell(Text("oussama")),
                    DataCell(Text("En Retard")),
                    DataCell(Text("y")),
                    DataCell(Text("100000 DA")),
                    DataCell(Text("Alger")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("9")),
                    DataCell(Text("abdelhak")),
                    DataCell(Text("En Retard")),
                    DataCell(Text("x")),
                    DataCell(Text("1000000 DA")),
                    DataCell(Text("Alger")),
                  ])
                ]),
          ),
          Divider(
            thickness: 5, // thickness of the line
            indent: 2, // empty space to the leading edge of divider.
            endIndent: 20, // empty space to the trailing edge of the divider.
            color: kPrimaryColor, // The color to use when painting the line.
            height: 20, // The divider's height extent.
          ),
        ],
      ),
    ));
  }
}
