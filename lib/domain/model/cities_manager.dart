import 'package:flutter/material.dart';
import 'package:gobusss/data/data_container.dart';
import 'package:gobusss/domain/model/model_container.dart';

import 'package:provider/provider.dart';


class CitiesProvider extends ChangeNotifier{

List<CityStation>? allStations ;
bool get isLoading  => allStations==null;

void init(){
  getAllStation().then((value) {
    allStations=value;
    notifyListeners();
  });

}
}