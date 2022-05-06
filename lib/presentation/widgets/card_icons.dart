import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import '../../data/data_container.dart';


class CardIcons extends StatefulWidget {
  const CardIcons({Key? key}) : super(key: key);

  @override
  State<CardIcons> createState() => _CardIconsState();
}

class _CardIconsState extends State<CardIcons> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: const Icon(
              SocialIcons.google,
            ),
            iconSize: 40,
            color: Colors.redAccent,
            onPressed: () {
              signInWithGoogle();
            },
          ),
          IconButton(
            icon: const Icon(
              SocialIcons.facebook,
            ),
            iconSize: 40,
            color: Colors.indigo,
            onPressed: () {
              signInWithFacebook();
            },
          ),
          IconButton(
            iconSize: 40,
            color: Colors.lightBlue,
            onPressed: () {},
            icon: const Icon(
              SocialIcons.twitter,
            ),
          ),
          IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.mobileScreen);
            },
            icon: const Icon(
              FontAwesomeIcons.mobileScreen,
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
