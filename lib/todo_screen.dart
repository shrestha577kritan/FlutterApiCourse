import 'package:apilearning/api.dart';
import 'package:flutter/material.dart';

import 'Model/TodoModel.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ApiConnection.getTodoData(),
                builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
                  return ListView.builder(
                    itemCount: ApiConnection.todoData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ReusableRow(
                              title: 'Title\n',
                              value: snapshot.data![index].title,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ReusableRow(
                              title: 'Completed',
                              value: snapshot.data![index].completed.toString(),
                            ),
                          ],
                        ),
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

class ReusableRow extends StatelessWidget {
  ReusableRow({required this.title, required this.value});
  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title,maxLines: 2,),
          SizedBox(
            width: 4,
          ),
          Text(value),
        ],
      ),
    );
  }
}
