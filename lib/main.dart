import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/dummy.dart';
import 'package:gobusss/model/book_now_manager.dart';
import 'package:gobusss/model/cities_manager.dart';
import 'package:gobusss/newtork/stations_api.dart';
import 'package:gobusss/screens/account_screen.dart';
import 'package:gobusss/screens/book_now.dart';


import 'package:provider/provider.dart';

import 'screens/departure_screen.dart';
import 'screens/home_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
 // for (var i in DUMMY_CityStation){
 //   insertStation(i);
 // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookNowManager(),),
        ChangeNotifierProvider(create: (context) => CitiesManager()..init(),),

      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.deepOrange,
            primary: Colors.indigo,


          ),
        ),
        home:  const HomeLayout(),
        routes: {
          DepartureScreen.routeName: (ctx) => const DepartureScreen(),
          BookNow.routeName: (ctx) =>  BookNow(),
          AccountScreen.routeName: (ctx) =>  const AccountScreen(),

        },
      ),
    );
  }
}
