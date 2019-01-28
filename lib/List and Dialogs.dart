import 'package:flutter/material.dart';

class ListDialog extends StatefulWidget {
  List data;

  ListDialog(this.data);

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
      itemCount: widget.data == null ? 0 : widget.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.data[index]["name"]["first"]),
          subtitle: Text(widget.data[index]["email"]),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),

            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.data[index]["picture"]["thumbnail"]
              ),
              backgroundColor: Colors.white,

            ),
          ),
          trailing: Text("${widget.data[index]["dob"]["age"]}"),
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Yes")),
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("No"))
                    ],
                    content: Text("Continue to delete user"),
                  );
                }).then((value) => print("the value is $value"));
          },
        );
      },
    );
  }
}
