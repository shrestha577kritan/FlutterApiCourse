import 'dart:convert';

import 'package:apilearning/Model/photo_model.dart';
import 'package:apilearning/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ApiConnection.getPhotoData(),
                builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                  return ListView.builder(
                    itemCount: ApiConnection.photoData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].title.toString()),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
