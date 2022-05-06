import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobusss/presentation/presentation_contatiner.dart';

class AvailableBusesView extends StatelessWidget {
  const AvailableBusesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Icon(
          FontAwesomeIcons.bus,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.outLineField,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipBehavior: Clip.hardEdge,
                clipper: TicketClipper(),
                child: Container(
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.white),
                  padding: EdgeInsets.all(16),
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior:Clip.none ,
                    children: [
                      Container(

                        child: Row(

                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("ahmed"),
                                ListTile(
                                  leading: Icon(Icons.navigation),
                                  title: Text('meloborn'),
                                  subtitle:
                                      Text(DateTime.now().toIso8601String()),
                                ),
                                ListTile(
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text('Giza'),
                                  subtitle:
                                      Text(DateTime.now().toIso8601String()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: DottedLine(
                          dashColor: Colors.grey,
                          direction: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.lineTo(0.0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(w * .50, 0), radius: 20.0));
    path.addOval(
        Rect.fromCircle(center: Offset(w * .50, size.height), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size? size ;
//     double w = size?.width??0.0;
//     double h= size?.height??0.0;
//
//
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: ClipPath(
//           clipper: TicketClipper(),
//           child: Container(
//             height: 220,
//             width: 350,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20), color: Colors.white),
//             padding: EdgeInsets.all(16),
//             child: Stack(
//
//               children: [
//                 Center(
//
//                   child: DottedLine(
//                     dashColor: Colors.grey,
//                     direction: Axis.vertical,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
