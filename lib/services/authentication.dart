import 'package:dio/dio.dart';
import 'package:test12/models/admin_response.dart';
import 'package:test12/services/exceptions/wrong_credentials.dart';
import 'exceptions/exceptions.dart';
import '../models/models.dart';
import 'dart:convert';

class Authentication {
  final Dio _dio = Dio();
  Future adminLogin(Compte compte) async {
    var status = '';
    const String apiPath =
        "http://dev.easy-relay.com/api/mob2/api.php?action=login";
    _dio.options.headers["email"] = compte.email;
    _dio.options.headers["mdp"] = compte.password;
    try {
      Response response = await _dio.get(apiPath);
      Map<String, dynamic> responseBody = json.decode(response.data);
      if (response.statusCode == 200) {
        AdminData body = AdminData(
          error: responseBody['error'] ?? '',
        );
        if (body.error == 'Wrong credentials') {
          throw WrongCredentials();
        }
      }
    } on Exception catch (e) {
      status = e.toString();
    } finally {
      return status;
    }
  }

  Future vendeurCreation(Vendeur vendeur) async {
    var status = '';
    const String apiPath =
        "https://dev.easy-relay.com/api/vendeur/creation.php?action=creationVendeurStandard";
    var data = FormData.fromMap(vendeur.toJson());
    try {
      Response response = await _dio.post(apiPath, data: data);
      Map<String, dynamic> responseBody = json.decode(response.data);
      if (response.statusCode == 200) {
        ResponseData body = ResponseData(
            errorCode: responseBody['error_code'] ?? '',
            message: responseBody['error_message'] ?? '',
            result: responseBody['result'] ?? '');
        if (body.errorCode == '-1') {
          throw UnexpectedError();
        }
        if (body.errorCode == "1") {
          throw CredentialException();
        }
        if (body.errorCode == "2") {
          throw ActionNotSetException();
        }
        if (body.errorCode == "3") {
          throw ActionNotFoundException();
        }
        if (body.errorCode == "4") {
          throw RequiredParamsException();
        }
        if (body.errorCode == "5") {
          throw OrderExistException();
        }
      }
    } on Exception catch (e) {
      status = e.toString();
    } finally {
      return status;
    }
  }
}
