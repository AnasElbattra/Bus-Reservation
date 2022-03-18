import 'package:flutter/material.dart';

import '../model/model.dart';
import 'departure_Item.dart';
import 'package:provider/provider.dart';

class Departure extends StatefulWidget {
  final String? headName;
  final void Function(CityStation city, String station)? onSelect;

  const Departure({Key? key,  this.headName, this.onSelect}) : super(key: key);

  @override
  State<Departure> createState() => _DepartureState();
}

class _DepartureState extends State<Departure> {
  @override
  Widget build(BuildContext context) {
    final citiesManager = context.watch<CitiesManager>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.indigo,
        title: Text(
          widget.headName!,
        ),
      ),
      body: citiesManager.isLoading
          ? const Center(
            child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
          )
          : SingleChildScrollView(
              child: ExpansionPanelList.radio(
                dividerColor: Colors.black45,
                initialOpenPanelValue: 2,
                children: citiesManager.allStations!.map((e) {
                  return ExpansionPanelRadio(
                    backgroundColor: Colors.white,
                    value: e.id,
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return DepartureItem(
                        name: e.name,
                      );
                    },
                    body: ListView.separated(
                      itemBuilder: (context, index) => Container(
                        color: Colors.indigo[50],
                        child: ListTile(
                          trailing: const Icon(
                            Icons.directions_bus_rounded,
                            color: Colors.orangeAccent,
                          ),
                          onTap: () {
                            widget.onSelect?.call(e, e.station[index]);
                          },
                          title: Text(
                            e.station[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black45,
                        height: 2,
                        thickness: 1,
                      ),
                      itemCount: e.station.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
