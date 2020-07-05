import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

import 'package:hackcation2020/camera.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hackcation2020/cameraBottom.dart';
import 'package:hackcation2020/profile.dart';
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
  FrontPageState createState() => FrontPageState();
}

class FrontPageState extends State<FrontPage> {
  int clothingCounter = 0; // Needs to be value from the UserProfile

  // This list will just copy the 2 lists from the Camera stored by Bharath
  // The copying happens by enterting the 2 lists as parameters in constructors
  // Right now these are just hardcoded values
  List<String> sampleTops = [
    "top/Black Top.jpg",
    "top/Grey Top.jpg",
    "top/White Top.jpg",
  ];

  //Same Logic Needed Above
  List<String> sampleBottoms = [
    "bottom/Black Trackpant.jpg",
    "bottom/Blue Gym Shorts.jpg",
    "bottom/Green Gym Shorts.jpg",
  ];

  int topIndex = 0;
  int bottomIndex = 0;

  int getClothingCounter() {
    return clothingCounter;
  }

  void _incrementClothingCounter() {
    setState(() {
      clothingCounter++;
    });
  }

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

  void _showDialog() {
    // flutter defined function
    _incrementClothingCounter();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print(getClothingCounter());
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confimation"),
          content: new Text("Outfit Confirmed"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App Screen'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {},
            //child: Text("Badges"),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        clothingcounter: getClothingCounter(),
                      ),
                    ));
              },
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
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
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        color: Colors.blueAccent,
                        onPressed: () {
                          // Code to Navigate to the Camera Plugin from Karthik Mohans Code
                          //Gonna use Navigate Push
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakePictureScreen(),
                              ));
                        },
                        // Navigate to a specific Top Camera
                        child: Text('Top Camera'),
                      ),
                    ),
                    /*Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        color: Colors.blueAccent,
                        onPressed: () {
                          // Code to Navigate to the Camera Plugin from Karthik Mohans Code
                          //Gonna use Navigate Push
                          // Gonna need to have 2 different camera classes which are literally a copy of each other
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakeBottomScreen(),
                              ));
                          //};
                        },
                        // Navigate to a specific Bottom Camera
                        child: Text('Bottom Camera'),
                      ),
                    ),*/
                    Expanded(
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                          child: IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                _showDialog();
                                // Selected confirmation must appear
                              }),
                          onPressed: () {
                            // Selected confirmation must appear
                            _showDialog();
                          }),
                    )
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
