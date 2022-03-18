import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = '/MoreScreen';
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'more',
          style: TextStyle(
            fontSize: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
