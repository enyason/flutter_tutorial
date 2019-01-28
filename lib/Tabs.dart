import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  Future<String> getUsersResult() async {
    String url = "https://randomuser.me/api/?results=5";
//   var response =

     var response = await http.get(Uri.decodeFull(url));

    var  res = json.decode(response.body);

    List data = res["results"];

    data.forEach((val)=>print(val["name"]["first"]));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: RaisedButton(
            onPressed: (){
              print("Raised button");
              getUsersResult();
            },
            color: Colors.lightBlue,
            child: Text("Add a Photo"),
          ),
        ),
      ),
    );
  }
}
