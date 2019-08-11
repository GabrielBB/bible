import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'dart:convert';

import 'book_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();

    loadBibleData().then((String d) => {
          setState(() {
            data = jsonDecode(d);
          })
        });
  }

  Future<String> loadBibleData() async {
    return await rootBundle.loadString('assets/es_rvr.json');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bible',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: BookListPage(title: 'Book List', books: this.data),
    );
  }
}
