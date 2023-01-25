import 'dart:convert';

import 'package:apilearning/Model/UserModel.dart';
import 'package:apilearning/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Userssss'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiConnection.getUserData(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(

                    itemCount: ApiConnection.userData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReusableRow(
                                title: 'Name',
                                value: snapshot.data![index].name.toString(),
                              ),
                              ReusableRow(
                                title: 'UserName',
                                value:
                                    snapshot.data![index].username.toString(),
                              ),
                              ReusableRow(
                                title: 'Email',
                                value: snapshot.data![index].email.toString(),
                              ),
                              ReusableRow(
                                title: 'Address',
                                value: snapshot.data![index].address!.city
                                    .toString() + snapshot.data![index].address!.geo!.lat
                                    .toString() +snapshot.data![index].address!.geo!.lng
                                    .toString() ,
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({required this.title, required this.value});

  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
