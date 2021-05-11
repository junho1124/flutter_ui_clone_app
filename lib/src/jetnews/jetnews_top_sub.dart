import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';

class JetNewsTopSub extends StatelessWidget {
  List<Result> news;

  JetNewsTopSub(this.news);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MakeItems(news: news[1]),
        MakeItems(news: news[2]),
      ],
    );
  }
}

class MakeItems extends StatelessWidget {
  const MakeItems({
    Key key,
    @required this.news,
  }) : super(key: key);

  final Result news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: 40,
                  child: Image.network("${news.publication.logoUrl}")),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${news.title}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Text(
                        "${news.metadata.date}",
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {}),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
