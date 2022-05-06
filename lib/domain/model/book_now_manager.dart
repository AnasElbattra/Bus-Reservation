import 'package:flutter/material.dart';
import 'package:gobusss/domain/model/model_container.dart';


class BookNowProvider extends ChangeNotifier {
  bool _isOneWay = true;
  bool get isRoundTrip => !_isOneWay;
  bool get isOneWay => _isOneWay;

  void clickOneWay() {
    _isOneWay = true;
    notifyListeners();
  }

  void clickRoundTrip() {
    _isOneWay = false;
    notifyListeners();
  }

  int _index = 0;

  int get selectedTap => _index;

  void goToTap(select) {
    _index = select;
    notifyListeners();
  }

  CityStation? cityStationFrom;

  String? stationFrom;

  CityStation? cityStationTo;

  String? stationTo;

  setFrom(CityStation cityStationFrom, String stationFrom) {
    this.stationFrom = stationFrom;
    this.cityStationFrom = cityStationFrom;
    notifyListeners();
  }

  setTo(CityStation cityStationTo, String stationTo) {
    this.stationTo = stationTo;
    this.cityStationTo = cityStationTo;
    notifyListeners();
  }

  DateTime dateTimeStart = DateTime.now();
  DateTime dateTimeEnd = DateTime.now();

  getDateTime(BuildContext context) {
    if (_isOneWay) {
      showDatePicker(
        context: context,
        initialDate: dateTimeStart,
        firstDate: DateTime.now(),
        lastDate: DateTime(2099),
      ).then(
        (date) {
          if (date == null) return;
          dateTimeStart = date;
          dateTimeEnd = date.add(
            const Duration(
              days: 0,
            ),
          );
          notifyListeners();
        },
      );
    } else {
      showDateRangePicker(
        initialDateRange: DateTimeRange(
          start: dateTimeStart,
          end: dateTimeEnd,
        ),
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2099),
      ).then(
        (date) {
          if (date == null) return;
          dateTimeStart = date.start;
          dateTimeEnd = date.end;
          notifyListeners();
        },
      );
    }
  }
}
