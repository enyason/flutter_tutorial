import 'package:flutter/material.dart';

class ListDialog extends StatefulWidget {
  @override
  _ListDialogState createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  @override
  Widget build(BuildContext context) {
    // using ListView manually
//    return ListView(
//      children: <Widget>[
//        Center(
//          child: Text("Emmanuel"),
//        ),
//        Center(
//          child: Text("Ideba "),
//        ),
//        Center(
//          child: Text("Enya"),
//        ),
//        Center(
//          child: Text("enyasonjnr@gmail.com"),
//        ),
//      ],
//    );

    // creating an infinite loop

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("enyason"),
          subtitle: Row(
            children: <Widget>[
              CircleAvatar(radius: 3.0,backgroundColor: Colors.green,),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text("active"),
              )
            ],
          ),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.delete),
          onTap: () {

            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext ctx) {

                  return AlertDialog(
                    actions: <Widget>[
                      new FlatButton(onPressed: (){
                        Navigator.of(context).pop(true);
                      }, child: Text("Yes")),
                      new FlatButton(onPressed: (){
                        Navigator.of(context).pop(false);

                      }, child: Text("No"))
                    ],
                    content: Text("Continue to delete user"),
                  );

                }).then((value)=> print("the value is $value"));


          },
        );
      },
    );
  }
}
