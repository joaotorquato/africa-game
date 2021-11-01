import 'package:flutter/material.dart';

///LoadingWidget
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      strokeWidth: 1,
    ));
  }
}
