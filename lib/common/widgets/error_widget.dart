import 'package:flutter/material.dart';

///ErrorWidget
class CustomErrorWidget extends StatelessWidget {
  ///ErrorWidget
  CustomErrorWidget({required Key key, required this.message})
      : super(key: key);

  ///Error message
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
        ),
      ],
    ));
  }
}
