import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

//import IconButton from '@material-ui/core/IconButton';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  //Widget build;

  void _incrementListItem() {
    setState(() {
      // This is where the List index is gonna be incremented
    });
  }

  void _decrementListItem() {
    setState(() {
      // This is where the list Index is gonna be decremented
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Screen'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      _incrementListItem();
                    }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset("images/gucci.jpg"),
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    _decrementListItem();
                    // This is where when u click u go one clothing item behind so in terms of structure in the list
                    // it means one behind. This List is being developed by Bharath
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
