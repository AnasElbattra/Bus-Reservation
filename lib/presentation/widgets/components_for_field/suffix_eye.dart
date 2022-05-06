import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuffixEyePassword extends StatefulWidget {
   SuffixEyePassword({Key? key,  required this.isSecure,this.setState}) : super(key: key);
 bool isSecure ;
 void Function()? setState;
  @override
  State<SuffixEyePassword> createState() => _SuffixEyePasswordState();
}

class _SuffixEyePasswordState extends State<SuffixEyePassword> {
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      splashColor:Colors.transparent ,
      enableFeedback: false,
      onPressed: widget.setState ,
      icon: Icon(!widget.isSecure
          ? FontAwesomeIcons.eye
          : FontAwesomeIcons.eyeSlash),
      iconSize: 20,
    );
  }
}
