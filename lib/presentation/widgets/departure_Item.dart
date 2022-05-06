import 'package:flutter/material.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';

class DepartureItem extends StatelessWidget {
  final id;
  final name;

  const DepartureItem({Key? key, this.name, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal:PaddingManager.p10),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium
      ),
    );
  }
}
