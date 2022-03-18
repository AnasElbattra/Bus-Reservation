import 'package:flutter/material.dart';

import '../model/book_now_manager.dart';
import '../widgets/oneway_roundtrip.dart';
import 'package:provider/provider.dart';

import '../widgets/choose_city.dart';
import '../widgets/depart_on.dart';
import 'departure_screen.dart';

class BookNow extends StatefulWidget {
  static const routeName = '/Book Now';

  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  @override
  Widget build(BuildContext context) {
    final bookNowManager = context.watch<BookNowManager>();
    return Container(
      color: Colors.indigo,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OneWayRoundTrip(
                    bottomLeft: 15,
                    topLeft: 15,
                    wayOrRound: "One Way",
                    onClick: () {
                      bookNowManager.clickOneWay();
                    },
                    condition: bookNowManager.isOneWay,
                  ),
                ),
                Expanded(
                  child: OneWayRoundTrip(
                    bottomRight: 15,
                    topRight: 15,
                    wayOrRound: "Round Trip",
                    onClick: () {
                      bookNowManager.clickRoundTrip();
                    },
                    condition: bookNowManager.isRoundTrip,
                  ),
                ),
              ],
            ),
          ),
          ChooseCity(
            city: bookNowManager.cityStationFrom?.name ?? '',
            station: bookNowManager.stationFrom ?? "",
            fromOrTo: 'From',
            routeName: DepartureScreen.routeName,
            isFrom: true,
          ),
          const Divider(
            endIndent: 30,
            indent: 30,
            color: Colors.white,
            thickness: 1,
          ),
          ChooseCity(
            city: bookNowManager.cityStationTo?.name ?? "",
            station: bookNowManager.stationTo ?? "",
            fromOrTo: 'To',
            routeName: DepartureScreen.routeName,
            isFrom: false,
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: bookNowManager.isOneWay == false
                          ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DepartOn(
                                    selectedDate: bookNowManager.dateTimeStart,
                                    onPressed: () {
                                      bookNowManager.getDateTime(context);
                                    },
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 24,
                                  color: Colors.deepOrange,
                                ),
                                Expanded(
                                  child: DepartOn(
                                    selectedDate: bookNowManager.dateTimeEnd,
                                    onPressed: () {
                                      bookNowManager.getDateTime(context);
                                    },
                                  ),
                                ),
                              ],
                            )
                          : DepartOn(
                              selectedDate: bookNowManager.dateTimeStart,
                              onPressed: () {
                                bookNowManager.getDateTime(context);
                              },
                            ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 30),
                    //   child: Divider(
                    //     height: 1,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'GO BUS',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size.fromRadius(50),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.indigo,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
