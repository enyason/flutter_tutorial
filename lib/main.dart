import 'package:flutter/material.dart';
import 'package:flutter_tutorial/List%20and%20Dialogs.dart';
import 'package:flutter_tutorial/Tabs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  List data;

  @override
  void initState() {
    super.initState();

    getUsersResult();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

   getUsersResult() async {

    String url = "https://randomuser.me/api/?results=15";

    var response = await http.get(Uri.decodeFull(url));

    var  res = json.decode(response.body);

    setState(() {
      data = res["results"];

    });


//    data.forEach((val)=>print(val["name"]["first"]));


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Demo"),
//            leading: Icon(Icons.featured_play_list),
            bottom: TabBar(
              controller: tabController,
              tabs: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("users"),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.add_a_photo),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("photo"),
                    )
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[ListDialog(data), TabPage()],
          )),
    );
  }
}
