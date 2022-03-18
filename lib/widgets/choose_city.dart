import 'package:flutter/material.dart';
import 'package:gobusss/model/book_now_manager.dart';

import 'package:gobusss/widgets/departure.dart';
import 'package:provider/provider.dart';

class ChooseCity extends StatelessWidget {
  final String city;
  final String routeName;
  final String station;
  final bool isFrom;

  final String fromOrTo;

  const ChooseCity(
      {Key? key,
      required this.city,
      required this.station,
      required this.fromOrTo,
      required this.routeName,
      required this.isFrom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookNowManager = context.read<BookNowManager>();
    return Expanded(
      flex: 3,
      child: Container(
        // padding: EdgeInsets.only(
        //   left: 16,
        // ),
        margin: const EdgeInsets.only(right: 8, left: 20),

        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Departure(
                    headName: isFrom ?"Departure From":'Departure To',
                    onSelect: (cityStation, station) {
                      if (isFrom) {
                        bookNowManager.setFrom(cityStation, station);
                      } else {
                        bookNowManager.setTo(cityStation, station);
                      }
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          },
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fromOrTo,
                      style: TextStyle(
                        color: Colors.indigoAccent.shade400,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      station,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
