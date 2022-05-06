
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gobusss/app/app_preferences.dart';
import 'package:gobusss/app/di.dart';
import 'package:gobusss/domain/model/model_container.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import 'package:gobusss/presentation/resources/language_manager.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initApp();
  await Firebase.initializeApp();

  // for (var i in DUMMY_CityStation){
  //   insertStation(i);
  // }

  runApp(
    EasyLocalization(
      supportedLocales: [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      fallbackLocale:ENGLISH_LOCAL ,
      child: Phoenix(

        child: MyApp(),
      ),
    ),
  );
}

