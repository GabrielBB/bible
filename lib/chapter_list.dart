import 'package:flutter/material.dart';

class ChapterListPage extends StatelessWidget {
  ChapterListPage({Key key, this.book}) : super(key: key);

  final dynamic book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(book["name"]),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(5.0),
        itemCount: book["chapters"].length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.grey[200],
            child: Center(child: Text('${book["name"]} $index')),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 2),
      ),
    );
  }
}
