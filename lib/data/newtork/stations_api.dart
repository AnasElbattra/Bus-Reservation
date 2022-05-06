import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/model_container.dart';

Future<List<CityStation>> getAllStation() async {
  final response =
      await FirebaseFirestore.instance.collection("Cities").orderBy('id').get();
  return response.docs
      .map(
        (e) => CityStation(
          id: e.id,
          name: e.data()["name"],
          station: (e.data()["station"] as List).cast(),
        ),
      )
      .toList();
}

insertStation(CityStation station) {
  FirebaseFirestore.instance.collection("Cities").doc(station.id).set({
    "id": station.id,
    "name": station.name,
    "station": station.station,
  });
}


