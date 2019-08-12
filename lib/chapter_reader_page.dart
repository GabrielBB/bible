import 'package:flutter/material.dart';
import 'verses_reader_widget.dart';

class ChapterReaderPage extends StatefulWidget {
  ChapterReaderPage({Key key, this.book, this.initialChapter})
      : super(key: key);

  final dynamic book;
  final int initialChapter;

  @override
  State<StatefulWidget> createState() =>
      _ChapterReaderState(this.initialChapter);
}

class _ChapterReaderState extends State<ChapterReaderPage> {
  _ChapterReaderState(this.chapterIndex);

  int chapterIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: chapterIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.book["name"]} ${chapterIndex + 1}'),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: widget.book["chapters"]
              .map<Widget>((verses) => VersesReaderWidget(verses: verses))
              .toList(),
          onPageChanged: (int index) {
            setState(() {
              chapterIndex = index;
            });
          },
          controller: _pageController,
        ));
  }
}
