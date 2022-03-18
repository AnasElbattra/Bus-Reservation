import 'package:flutter/material.dart';
import 'package:gobusss/widgets/departure.dart';
class DepartureScreen extends StatefulWidget {
  static const routeName = '/departure Screen';

  const DepartureScreen({Key? key}) : super(key: key);

  @override
  _DepartureFromState createState() => _DepartureFromState();
}

class _DepartureFromState extends State<DepartureScreen> {

  @override
  Widget build(BuildContext context) {
    return const Departure();
  }
}
