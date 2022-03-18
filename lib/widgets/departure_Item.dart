import 'package:flutter/material.dart';
class DepartureItem extends StatelessWidget {
  final id;
  final name ;

  const DepartureItem({Key? key, this.name,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),

      child: Text(
        name,
        style: const TextStyle(fontSize: 18, color: Colors.indigo),

      ),
    );
  }
}

