import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test12/Screens/vendeur/widgets/wilya_button.dart';
import 'package:test12/bloc/livreur_bloc.dart';

class ChercherLivreur extends StatefulWidget {
  const ChercherLivreur({
    Key? key,
  }) : super(key: key);

  @override
  State<ChercherLivreur> createState() => _ChercherLivreurState();
}

class _ChercherLivreurState extends State<ChercherLivreur> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LivreurBloc>(context).add(GetLivreur());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivreurBloc, LivreurState>(builder: (context, state) {
      var stringList;
      if (state is LivreurReady) {
        var stringList =
            state.livreurs.map((e) => '${e.nom!} ${e.prenom!}').toList();
        return WilayaButton(items: stringList, hint: "Choisissez un livreur");
      } else {
        return WilayaButton(
          items: [''],
          hint: "Choisissez un livreur",
        );
      }
      /*Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    color: Colors.black.withOpacity(0.05)),
              ]),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              if (state is LivreurReady) {
                var stringList = state.livreurs
                    .map((e) => '${e.nom!} ${e.prenom!}')
                    .toList();
                return stringList.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
              if (state is LivreurInitial) {
                return ["Chargement liste de livreurs..."];
              } else {
                return ["Erreur lors du chargement de la liste des livreurs"];
              }
            },
            optionsViewBuilder: (context, onSelected, options) => Padding(
              padding: const EdgeInsets.only(top: 5, right: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 10, left: 16),
                          child: Text(
                            "Livreurs",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )),
                      Flexible(
                        child: ListView.separated(
                          separatorBuilder: (context, i) {
                            return const Divider();
                          },
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return InkWell(
                              onTap: () => onSelected(option),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, top: 16, right: 16, left: 16),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                decoration:
                    const InputDecoration(hintText: "Entrez le nom du livreur"),
                focusNode: focusNode,
                onFieldSubmitted: (String value) {
                  onFieldSubmitted();
                  debugPrint('You just typed a new entry  $value');
                },
              );
            },
            onSelected: (String selection) {
              debugPrint('You just selected $selection');
            },
          ));
    });*/
    });
  }
}
