import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget{
  final String _assetpath;

  ImageBanner(this._assetpath);

  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(_assetpath),
    );
  }
}