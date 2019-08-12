import 'package:flutter/material.dart';
import 'chapter_reader_page.dart';

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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChapterReaderPage(book: book, initialChapter: index)),
              );
            },
            child: Container(
                height: 50,
                color: Colors.grey[200],
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: Text('${index + 1}'),
                    ),
                    title: Text('${book["name"]} ${index + 1}'))),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 2),
      ),
    );
  }
}
