import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetpath;

  ImageBanner(this._assetpath);

  FlatButton sampleButton = FlatButton(
    color: Colors.blue,
    child: Text("Save Image"),
    onPressed: () {
      // Take the image from the file to the database - Easier Migration of the Application
    },
  );

  Widget build(BuildContext context) {
    //sampleButton;
    return Container(
        padding: const EdgeInsets.all(64),
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: <Widget>[Image.asset(_assetpath), sampleButton],
        )
        //child: Image.asset(_assetpath),

        // child: Image.asset(_assetpath),
        //child: FlatButton(),
        );
  }
}
