import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  final int clothingcounter;

  //requiring the list of todos
  ProfilePage({Key key, @required this.clothingcounter}) : super(key: key);
  @override
  _ProfilePageState createState() =>
      _ProfilePageState(outfits: clothingcounter);
}

class _ProfilePageState extends State<ProfilePage> {
  final int outfits;
  _ProfilePageState({Key key, @required this.outfits});
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
          children: <Widget>[Text("Username: "), Text("Client 1")],
        ),
        Row(
          children: <Widget>[Text("Number of Outfits: "), Text("$outfits")],
        ),
        Row(
          children: <Widget>[
            /* Container(
                  child: AspectRatio(
                    aspectRatio: 3/2,
                  )*/
            Text("Achievements"),
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset(
              "batches/batch1.png",
              scale: 15,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              "batches/batch2.png",
              scale: 3,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              "batches/batch3.jpg",
              scale: 4,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),

        //),
      ]),
    );
  }
}
