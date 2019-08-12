import 'package:flutter/material.dart';
import 'chapter_list_page.dart';

class BookListPage extends StatelessWidget {
  BookListPage({Key key, this.title, this.books}) : super(key: key);

  final String title;
  final List<dynamic> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(5.0),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChapterListPage(book: books[index])),
              );
            },
            child: Container(
              height: 50,
              color: Colors.grey[200],
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text(books[index]["abbrev"]),
                  ),
                  title: Text(books[index]["name"])),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 2),
      ),
    );
  }
}
