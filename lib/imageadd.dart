import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetpath;

  ImageBanner(this._assetpath);

  FlatButton sampleButton = FlatButton(
    color: Colors.black,
    child: Text("Save Image"),
    onPressed: () {
      // Take the image from the file to the database - Easier Migration of the Application
    },
  );

  Widget build(BuildContext context) {
    //sampleButton;
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: <Widget>[sampleButton, Image.asset(_assetpath)],
        )
        //child: Image.asset(_assetpath),

        // child: Image.asset(_assetpath),
        //child: FlatButton(),
        );
  }
}
