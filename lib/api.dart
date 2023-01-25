import 'dart:convert';
import 'package:apilearning/Model/PostModel.dart';
import 'package:apilearning/Model/UserModel.dart';
import 'package:apilearning/Model/photo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'Model/TodoModel.dart';

class ApiConnection {
  static final List<PostModel> postData = [];

  static Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map data in data) {
        postData.add(PostModel.fromJson(data));
      }
      return postData;
    } else {
      return postData;
    }
  }

  static final List<PhotoModel> photoData = [];
  static Future<List<PhotoModel>> getPhotoData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map data in data) {
        PhotoModel photos =
            PhotoModel(title: data['title'], url: data['url'], id: data['id']);

        photoData.add(photos);
      }
      return photoData;
    } else {
      return photoData;
    }
  }

  static final List<UserModel> userData = [];
  static Future<List<UserModel>> getUserData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map data in data) {
        userData.add(UserModel.fromJson(data));
      }

      return userData;
    } else {
      return userData;
    }
  }

  static final List<TodoModel> todoData = [];

  static Future<List<TodoModel>> getTodoData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map data in data) {
        todoData.add(TodoModel.fromJson(data));

      }
      return todoData;
    } else {
      return todoData;
    }
  }
}
