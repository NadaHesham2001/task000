
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:http/http.dartt'as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {




  void initState() {
    getTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('task'),
        backgroundColor: Colors.cyanAccent[100],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.purple[100],
              onPressed: () {

              }, child: Text('add task'),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(20),

                  ),
                  height: 50,
                  child: Text(""),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  List tasks = [];
  Future getTask()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var responsebody = jsonDecode(response.body);
    setState(() {
      tasks.addAll(responsebody);
    });
  }

  Future postTask() async{
    var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      body:{
      'title ' : 'taskA','body': 'bb' ,'userId': '1'
      }
    );
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;


  }

}
