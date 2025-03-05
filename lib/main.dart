import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // CircleAvatar(
//             //   radius: 50,
//             //   backgroundColor: Colors.blue,
//             // ),
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50),
//                 ),
//                 border: Border(
//                   bottom: BorderSide(color: Colors.black, width: 2),
//                   left: BorderSide(color: Colors.black, width: 2),
//                   right: BorderSide(color: Colors.black, width: 2),
//                   top: BorderSide(color: Colors.black, width: 2),
//                 ),
//                 // color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text("Hello"),
//           ],
//         ),
//       ),
//     ),
//   ));
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Hello(),
    );
  }
}

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rezisableBoxesandCircles(
              deviceHeight: deviceHeight,
              numberOfCircle: 2,
              numberOfContainer: 2,
              devicewidth: devicewidth),
        ),
      ),
    );
  }
}

List<Widget> rezisableBoxesandCircles(
    {required int numberOfContainer,
    required int numberOfCircle,
    required double deviceHeight,
    required double devicewidth}) {
  List<Widget>? rezisableBoxesandCircles = [];
  while (numberOfContainer > 0) {
    rezisableBoxesandCircles.add(boxes(
        numberOfContainer: numberOfContainer,
        numberOfCircle: numberOfCircle,
        deviceHeight: deviceHeight,
        devicewidth: devicewidth));
    numberOfContainer--;
  }

  return rezisableBoxesandCircles;
}

Widget boxes(
    {required int numberOfContainer,
    required int numberOfCircle,
    required double deviceHeight,
    required double devicewidth}) {
  double maxHeight = (numberOfContainer < 2)
      ? devicewidth / 2
      : ((devicewidth) - ((numberOfContainer - 1) * 5));
  double boxHeight = (maxHeight / numberOfContainer);
  double boxWidth = devicewidth - 20;
  List<Widget> circles = [];
  int NoOfCircle = numberOfCircle;
  while (numberOfCircle-- > 0) {
    circles.add(circle(
        numberOfCircle: NoOfCircle,
        boxHeight: boxHeight,
        boxWidth: boxWidth));
      }
  Widget? box = Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: boxHeight,
      width: boxWidth,
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Center(
        child: Row(
          mainAxisAlignment: (NoOfCircle < 2)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: circles,
        ),
      ));

  return box;
}

Widget circle(
    {required int numberOfCircle,
    required double boxHeight,
    required double boxWidth}) {
  double maxHeight = (numberOfCircle < 2)
      ? boxHeight
      : ((boxWidth / 2) - ((numberOfCircle - 1) * 1));
  double circleRadius = maxHeight / numberOfCircle;
  Widget? circle = Container(
    margin: EdgeInsets.symmetric(horizontal: 1),
    height: circleRadius,
    width: circleRadius,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(circleRadius),
      ),
      border: Border(
        bottom: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
        top: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
        left: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
        right: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
      ),
    ),
  );
  return circle;
}

// List<Widget> circles(
//     {required int numberOfCircle,
//     required double boxHeight,
//     required double boxWidth}) {
//   List<Widget>? circles = [];
//   double maxHeight = (numberOfCircle < 2)
//       ? boxHeight
//       : ((boxWidth / 2) - ((numberOfCircle - 1) * 1));
//   double circleRadius = maxHeight / numberOfCircle;
//   while (numberOfCircle > 0) {
//     circles.add(Container(
//       margin: EdgeInsets.symmetric(horizontal: 1),
//       height: circleRadius,
//       width: circleRadius,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(circleRadius),
//         ),
//         border: Border(
//           bottom: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           top: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           left: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           right: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//         ),
//       ),
//     ));
//     numberOfCircle--;
//   }
//   return circles;
// }
// List<Widget> boXwithCircles(
//     {required double height,
//     required double width,
//     required double mainBorderWIdth,
//     required Color mainBorderColor,
//     required double circleHeight,
//     required int numberOfCircle,
//     required int numberOfContainer}) {
//   List<Widget>? containers = [];
//   while (numberOfContainer > 0) {
//     containers.add(Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0),
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//           border: Border.all(width: mainBorderWIdth, color: mainBorderColor)),
//       child: Center(
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: circles(
//                 circleHeight: circleHeight, numberOfCircle: numberOfCircle)),
//       ),
//     ));
//     numberOfContainer--;
//   }
//   return containers;
// }

// List<Widget> circlesWithConstRadius(
//     {required double circleHeight, required int numberOfCircle}) {
//   List<Widget>? circles = [];
//   while (numberOfCircle > 0) {
//     circles.add(Container(
//       margin: EdgeInsets.symmetric(horizontal: 3.0),
//       height: circleHeight,
//       width: circleHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(circleHeight),
//         ),
//         border: Border(
//           bottom: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           top: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           left: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//           right: BorderSide(color: const Color.fromARGB(255, 5, 5, 5)),
//         ),
//       ),
//     ));
//     numberOfCircle--;
//   }

//   return circles;
// }
