import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobusss/app/app_container.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_preferences.dart';
import '../../app/di.dart';

class AccountPage extends StatefulWidget {
  final bool? isLoading;

  const AccountPage({Key? key, this.isLoading}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AppPreferences _appPreferences = getIt<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user?.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Stack(children: [
              Container(
                color: Colors.grey[500],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepOrange,
                      child: CircleAvatar(
                        radius: 28,
                        foregroundColor: Colors.blueAccent,
                        backgroundColor: Colors.grey[500],
                        child: Text(
                          StringManager.hello.tr(),
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    snapshot.data!.exists
                        ? Text(
                            snapshot.data?['username'] ?? Constants.empty,
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 24),
                          )
                        : Text(
                            user?.displayName ?? Constants.empty,
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 24),
                          ),
                  ],
                ),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextButton(
                      text: StringManager.signOut.tr(),
                      iconData: FontAwesomeIcons.arrowRightFromBracket,
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      context: context,
                    ),
                    CustomTextButton(
                        text: StringManager.language.tr(),
                        iconData: FontAwesomeIcons.globe,
                        onPressed: () {
                          _changeLanguage();
                        },
                        context: context),
                  ],
                ),
              )
            ]),
          );
        });
  }

  _changeLanguage() {
    _appPreferences.ChangeAppLanguage();
    Phoenix.rebirth(context);
  }
}

Widget CustomTextButton({
  required Function() onPressed,
  required String text,
  required IconData iconData,
  required BuildContext context,
  Key? key,
}) {
  return Container(
    key: key,
    width: double.infinity,
    child: TextButton.icon(
      onPressed: onPressed,
      icon: Icon(iconData),
      label: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      style: TextButton.styleFrom(
        primary: ColorManager.primary,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          vertical: PaddingManager.p6,
          horizontal: PaddingManager.p6,
        ),
      ),
    ),
  );
}
