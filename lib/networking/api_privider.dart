import 'dart:convert';
import 'dart:developer';

import 'package:bhart_app/networking/network_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  String authToken =
      '\$2y\$10\$6y7rX3ImTQUeZhk24lfjkObnOVqa4Y/crkJVybErTK8CX2UXLRVEq';
  Future<dynamic> getMethod() async {
    var res = await http.get(
      Uri.parse(NetworkConstant.BASE_URL),
      headers: {
        "Content-Type": "application/json",
        // 'X-Auth-Token': ' $authToken'
      },
    );
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      return 'error';
    }
  }

  Future<dynamic> postBeforeAuth(
      Map<String, dynamic> parameter, String url) async {
    // debugger();
    String baseurl = "https://us-central1-delhimetroapi.cloudfunctions.net";
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseurl + url).replace(queryParameters: parameter),
        headers: {
          "Content-Type": "application/json",
          // 'X-Auth-Token': ' $authToken'
        },
      );
      // debugger();
      responseJson = jsonDecode(response.body);
      print("resulrtgkuwhfufekfuy" + responseJson);
      // print(response);
    } catch (e) {
      // debugger();
      // print(e);
      print(e);
    }
    return responseJson;
  }
}

Future fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  print(response.body);

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return Album.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class myappppppp extends StatefulWidget {
  const myappppppp({super.key});

  @override
  State<myappppppp> createState() => _MyAppState();
}

class _MyAppState extends State<myappppppp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Text("ejblj"),
          // child: FutureBuilder<Album>(
          //   future: futureAlbum,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.title);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }

          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}
