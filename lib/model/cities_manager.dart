import 'package:flutter/material.dart';
import 'package:gobusss/model/station.dart';
import 'package:gobusss/newtork/stations_api.dart';
import 'package:provider/provider.dart';


class CitiesManager extends ChangeNotifier{

List<CityStation>? allStations ;
bool get isLoading  => allStations==null;

void init(){

  getAllStation().then((value) {
    allStations=value;
    notifyListeners();
  });

}
}