import 'package:apilearning/api.dart';
import 'package:flutter/material.dart';

import 'Model/PostModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Api Integration',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiConnection.getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: ApiConnection.postData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.red,
                          shadowColor: Colors.grey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 15),
                              ),
                              Text(ApiConnection.postData[index].title
                                  .toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 15),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(ApiConnection.postData[index].body
                                  .toString()),
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
