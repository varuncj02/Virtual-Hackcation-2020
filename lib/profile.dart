import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int outfits = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Profile"),
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[Text("Username:"), Text("Client 1")],
          ),
          Row(
            children: <Widget>[Text("Number of Outfits"), Text("$outfits")],
          ),
          Row(children: <Widget>[
            /* Container(
                  child: AspectRatio(
                    aspectRatio: 3/2,
                  )*/
            Image.asset(
              "batches/batch1.png",
              scale: 15,
              fit: BoxFit.fitWidth,
            ),
            //),
            Text("Achievements")
          ]),
        ]));
  }
}
