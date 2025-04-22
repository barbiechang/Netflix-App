import 'package:flutter/material.dart';
import './model.dart';
import './database.dart';

class addForm extends StatefulWidget {
  @override
  State<addForm> createState() => _addFormState();
}

class _addFormState extends State<addForm> {
  AppDatabase db = AppDatabase();

  final titleController = TextEditingController();
  final conversationController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Center(
          child: Text(
            'Search Movie',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Column(
              children: [
                Text(
                  'New conversation',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add a title',
                    icon: Icon(Icons.title),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: conversationController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Add a actor',
                    icon: Icon(Icons.description),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: typeController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Add a type',
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Map data = {
                      'title': titleController.text,
                      'conversation': conversationController.text,
                      'type': typeController.text
                    };
                    insert(data);
                    Navigator.pop(context);
                  },
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void insert(Map input) async {
    TopicModel data = TopicModel(
      title: input['title'],
      conversation: input['conversation'],
    );
    await db.insertData(data);
  }
}
