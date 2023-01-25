import 'dart:convert';

import 'package:http/http.dart';

import 'package:http/http.dart';

class LoginSignup {
  static Register(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Account Created Successfully');
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        // final data = jsonDecode(response.body.toString());
        // print(data['token']);
        print('Login Successfully');
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
