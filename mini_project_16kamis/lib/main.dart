import 'package:flutter/material.dart';
import 'package:mini_project_16kamis/API.dart';
import 'package:mini_project_16kamis/tugas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Api());
  }
}

//     // MaterialApp(
//     //   title: 'Flutter Demo',
//     //   debugShowCheckedModeBanner: false,
//     //   home: Tugas(),

//     //);
//   }
// }
