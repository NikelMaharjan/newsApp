


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageLoad extends StatelessWidget {
  const ImageLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingFour(
        color: Colors.blueAccent,
        size: 30,
      ),
    );
  }
}
