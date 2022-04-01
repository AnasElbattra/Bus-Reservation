import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
 final bool? isLoading;
  const AccountPage({Key? key, this.isLoading}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
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
                          'Hello',
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      snapshot.data?['username'] ?? "",
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 24),
                    )
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
                    Container(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                        FirebaseAuth.instance.signOut();
                        },
                        icon: Icon(FontAwesomeIcons.arrowRightFromBracket),
                        label: Text(
                          'Sign Out',
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
