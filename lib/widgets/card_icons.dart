import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobusss/widgets/account_page.dart';

import '../newtork/social_auth.dart';

class CardIcons extends StatefulWidget {
  const CardIcons({Key? key}) : super(key: key);

  @override
  State<CardIcons> createState() => _CardIconsState();
}

class _CardIconsState extends State<CardIcons> {
  var _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder<Object>(
              future: signInWithGoogle(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return IconButton(
                    iconSize: 40,
                    color: Colors.redAccent,
                    onPressed: () async {
                      setState(() {
                        _isSigningIn = true;
                      });

                      Future<UserCredential> user = signInWithGoogle();

                      setState(() {
                        _isSigningIn = false;
                      });

                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AccountPage(),
                          ),
                        );
                      }
                    },
                    icon: const Icon(
                      SocialIcons.google,
                    ),
                  );
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                );
              }),
          IconButton(
            iconSize: 40,
            color: Colors.indigo,
            onPressed: () {},
            icon: const Icon(
              SocialIcons.facebook,
            ),
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
            onPressed: () {},
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
