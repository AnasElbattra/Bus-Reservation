import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gobusss/app/app_container.dart';
import 'package:gobusss/domain/model/model_container.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';
import '../../widgets/oneway_roundtrip.dart';
import 'package:provider/provider.dart';
import '../../widgets/choose_city.dart';
import '../../widgets/depart_on.dart';

class BookNow extends StatefulWidget {


  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  @override
  Widget build(BuildContext context) {
    final bookNowProvider = context.watch< BookNowProvider>();
    return Container(
      color: Colors.indigo,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingManager.p10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OneWayRoundTrip(
                    bottomLeft: SizeManager.s14,
                    topLeft: SizeManager.s14,
                    wayOrRound: StringManager.oneWay.tr(),
                    onClick: () {
                      bookNowProvider.clickOneWay();
                    },
                    condition: bookNowProvider.isOneWay,
                  ),
                ),
                Expanded(
                  child: OneWayRoundTrip(
                    bottomRight: SizeManager.s14,
                    topRight: SizeManager.s14,
                    wayOrRound: StringManager.roundTrip.tr(),
                    onClick: () {
                      bookNowProvider.clickRoundTrip();
                    },
                    condition: bookNowProvider.isRoundTrip,
                  ),
                ),
              ],
            ),
          ),
          ChooseCity(
            city: bookNowProvider.cityStationFrom?.name ?? Constants.empty,
            station: bookNowProvider.stationFrom ?? Constants.empty,
            fromOrTo: StringManager.from.tr(),
            routeName: DepartureScreen.routeName,
            isFrom: true,
          ),
          const Divider(
            endIndent: SizeManager.s30,
            indent: SizeManager.s30,
            color: Colors.white,
            thickness: SizeManager.s1,
          ),
          ChooseCity(
            city: bookNowProvider.cityStationTo?.name ?? Constants.empty,
            station: bookNowProvider.stationTo ?? Constants.empty,
            fromOrTo: StringManager.to.tr(),
            routeName: DepartureScreen.routeName,
            isFrom: false,
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: ColorManager.outLineField,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(PaddingManager.p16),
                      child: bookNowProvider.isOneWay == false
                          ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DepartOn(
                                    selectedDate: bookNowProvider.dateTimeStart,
                                    onPressed: () {
                                      bookNowProvider.getDateTime(context);
                                    },
                                  ),
                                ),
                                 Icon(
                                  Icons.arrow_forward_outlined,
                                  size: SizeManager.s24,
                                  color: ColorManager.deepOrange,
                                ),
                                Expanded(
                                  child: DepartOn(
                                    selectedDate: bookNowProvider.dateTimeEnd,
                                    onPressed: () {
                                      bookNowProvider.getDateTime(context);
                                    },
                                  ),
                                ),
                              ],
                            )
                          : DepartOn(
                              selectedDate: bookNowProvider.dateTimeStart,
                              onPressed: () {
                                bookNowProvider.getDateTime(context);
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AvailableBusesView(),
                          ),
                        );
                      },
                      child: Text(
                        StringManager.goBus.tr(),
                        style: TextStyle(
                          fontSize: SizeManager.s20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size.fromRadius(SizeManager.s50),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(ColorManager.deepOrange),
                        backgroundColor: MaterialStateProperty.all(
                         ColorManager.primary,
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
