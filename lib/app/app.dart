import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/app/app_preferences.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import 'package:provider/provider.dart';

import '../domain/model/model_container.dart';
import 'di.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPreferences = getIt<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {
          context.setLocale(local),
        });
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookNowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CitiesProvider()..init(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Go Bus',
        theme: getThemeData(),

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: Routes.splash,
        onGenerateRoute: RouteGenerator.getRoute,
        home: const HomeLayout(),
      ),
    );
  }
}
