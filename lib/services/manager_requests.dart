import 'dart:convert';

import 'package:dio/dio.dart';
import './exceptions/exceptions.dart';
import '../models/models.dart';

class ManagerRequests {
  final Dio _dio = Dio();

  //ManagerRequests._();
  Future getLivreurs(Compte compte) async {
    var status = '';
    const String apiPath =
        "https://dev.easy-relay.com/api/mob2/api.php?action=livreurs";
    _dio.options.headers["email"] = compte.email;
    _dio.options.headers["mdp"] = compte.password;
    try {
      Response response = await _dio.get(apiPath);
      var responseBody = json.decode(response.data);
      if (response.statusCode == 200) {
        if (responseBody is Map<String, dynamic>) {
          throw WrongCredentials();
        }

        List<Livreur> livreurs = responseBody
            .map<Livreur>((element) =>
                Livreur(nom: element["nom"], prenom: element["prenom"]))
            .toList();
        return livreurs;
      }
    } on Exception catch (e) {
      status = e.toString();
      return status;
    }
  }
}
