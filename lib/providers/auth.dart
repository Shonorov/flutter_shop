import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDTxIGcihv0F4vdN77g6IzDyNvuoBQ1VDk";
    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      });
    } on Exception catch (e) {
      // TODO
    }
  }
}
