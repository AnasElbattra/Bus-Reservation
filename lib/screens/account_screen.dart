import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobusss/widgets/account_auth.dart';
import 'package:gobusss/widgets/account_page.dart';

class AccountScreen extends StatefulWidget {
  static const routeName = 'sign in ';

  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _auth = FirebaseAuth.instance;
  var isLoading = false;

  void _submitAccountForm(
    String email,
    String password,
    String username,
    bool isSignIn,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    try {
      setState(() {
        isLoading = true;
      });

      if (isSignIn) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(userCredential);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
        'username': username,
      });
      }//close else
    } on FirebaseAuthException catch (e) {
      var message = 'An error occurred, pelase check your credentials!';

      if (e.message != null) {
        message = e.message!;
      }
      ScaffoldMessenger.of(context)..hideCurrentSnackBar..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    }  catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData ) {
            return  AccountPage(isLoading: isLoading=false,);
            // create var isLoading in AccountPage and initialize here to false
          }
          return AccountForm(
            submitFn: _submitAccountForm,
            isLoading: isLoading,
          );
        });
  }
}
