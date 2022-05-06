import 'package:flutter/material.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String tripScreen = '/trip';
  static const String busesScreen = '/buses';
  static const String mobileScreen = '/mobile screen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.home:

        return MaterialPageRoute(builder: (context) => HomeLayout());
      case Routes.tripScreen:
        return MaterialPageRoute(builder: (context) => DepartureScreen());
      case Routes.mobileScreen:
        return MaterialPageRoute(builder: (context) => MobileView());
      case Routes.busesScreen:
        return MaterialPageRoute(builder: (context) => AvailableBusesView());
      default:
        return throw Container(
          child: Center(
            child: Text("No Route Road"),
          ),
          color: Colors.blue,
        );
    }
  }
}
