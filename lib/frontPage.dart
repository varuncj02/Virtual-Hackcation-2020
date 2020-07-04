import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

import 'package:hackcation2020/camera.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
//import IconButton from '@material-ui/core/IconButton';

/**
 * So the Base UI or layout is done 
 * Tasks to Do with this Class File or Around it:
 * 1. In the Camera Button we write navigation code to the Flutter Camera
 * 2. We need to Find a way to instead of hardcoded lists import a prepared list
 * 3. In a continuation of point 2 basically find a way to store the image captured - way to do that is to use 
 *    the google libraries to create an automatic file path and then store that file path as a List of Strings 
 *    in some other classes
 */

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  // This list will just copy the 2 lists from the Camera stored by Bharath
  // The copying happens by enterting the 2 lists as parameters in constructors
  // Right now these are just hardcoded values
  List<String> sampleTops = [
    "images/gucci.jpg",
    "images/shirt1.jpg",
    "images/shirt2.jpg",
  ];

  //Same Logic Needed Above
  List<String> sampleBottoms = [
    "images/jeans.jpg",
    "images/jeans2.jpg",
    "images/jeans3.jpg",
  ];

  int topIndex = 0;
  int bottomIndex = 0;

  void _incrementListItemTop() {
    setState(() {
      // This is where the List index for top is gonna be incremented
      topIndex++;
    });
  }

  void _decrementListItemTop() {
    setState(() {
      // This is where the list Index for top is gonna be decremented
      topIndex--;
    });
  }

  void _incrementListItemBottom() {
    setState(() {
      // This is where the List index for Bottom is gonna be incremented
      bottomIndex++;
    });
  }

  void _decrementListItemBottom() {
    setState(() {
      // This is where the list Index for Bottom is gonna be decremented
      bottomIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App Screen'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 80, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Transform.rotate(
                      angle: 180 * pi / 180,
                      child: IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            _decrementListItemTop();
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    //child: Image.asset("images/gucci.jpg"),
                    child: Image.asset(sampleTops[topIndex]),
                  ),
                  Expanded(
                    child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          _incrementListItemTop();
                          // This is where when u click u go one clothing item behind so in terms of structure in the list
                          // it means one behind. This List is being developed by Bharath
                        }),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Transform.rotate(
                      angle: 180 * pi / 180,
                      child: IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            _decrementListItemBottom();
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(sampleBottoms[bottomIndex]),
                  ),
                  Expanded(
                    child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          _incrementListItemBottom();
                          // This is where when u click u go one clothing item behind so in terms of structure in the list
                          // it means one behind. This List is being developed by Bharath
                        }),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          // Code to Navigate to the Camera Plugin from Karthik Mohans Code
                          //Gonna use Navigate Push
                        },
                        // Navigate to a specific Top Camera
                        child: Text('Top Camera'),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          // Code to Navigate to the Camera Plugin from Karthik Mohans Code
                          //Gonna use Navigate Push
                          // Gonna need to have 2 different camera classes which are literally a copy of each other
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakePictureScreen(),
                              ));
                          //};
                        },
                        // Navigate to a specific Bottom Camera
                        child: Text('Bottom Camera'),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}