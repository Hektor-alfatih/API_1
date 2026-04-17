import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List data = [];
  bool isLoading = true;

  Future ambilData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));

    // var hasil = jsonDecode(response.body);
    // setState(() {
    //   data = hasil;
    //   isLoading = false;
    // });

    if (response.statusCode == 200) {
      var hasil = jsonDecode(response.body);
      setState(() {
        data = hasil['products'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  } // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: data.take(5).map((item) {
                // return ListTile(
                //   title: Text(item['email']),
                //   subtitle: Text(item['name']),
                // );
                return Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item['images'][0],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),

                            Text(
                              item['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white70),
                            ),

                            SizedBox(height: 6),

                            Text(
                              "\$${item['price']}",
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}

//-----------------------------------------
// class _MyAppState extends State<MyApp> {
//   List data = [];
//   bool isLoading = true;

//   Future ambilData() async {
//     var response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/users'),
//     );

//     var hasil = jsonDecode(response.body);
//     setState(() {
//       data = hasil;
//       isLoading = false;
//     });
//   } // This widget is the root of your application.

//   @override
//   void initState() {
//     super.initState();
//     ambilData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView(
//               children: data.map((item) {
//                 return ListTile(title: Text(item['email']));
//               }).toList(),
//             ),
//     );
