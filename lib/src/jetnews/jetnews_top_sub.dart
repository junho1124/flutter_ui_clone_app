import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';
import 'package:flutter_ui_clone_app/src/detail_page/detail_page.dart';

class JetNewsTopSub extends StatelessWidget {
  List<Result> news;

  JetNewsTopSub(this.news);

  @override
  Widget build(BuildContext context) {
    List<MakeItems> items = [];
    for (int i = 1; i < 3; i++) {
      items.add(MakeItems(news: news[i]));
    }
    return Column(
      children: items
    );
  }
}

class MakeItems extends StatefulWidget {
  const MakeItems({
    Key key,
    @required this.news,
  }) : super(key: key);

  final Result news;

  @override
  _MakeItemsState createState() => _MakeItemsState();
}

class _MakeItemsState extends State<MakeItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPages(widget.news)));
      },
      child: Column(
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
                    child: Image.network("${widget.news.publication.logoUrl}")),
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
                      "${widget.news.title}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Text(
                          "${widget.news.metadata.author.name} - ${widget.news.metadata.readTimeMinutes} min read",
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
                    icon: context.read<JetNewsProvider>().bookMark.contains(widget.news.id)
                        ? Icon(Icons.bookmark)
                        : Icon(Icons.bookmark_border),
                    onPressed: () {
                      setState(() {
                        if (context.read<JetNewsProvider>().bookMark.contains(widget.news.id)) {
                          context.read<JetNewsProvider>().bookMark.remove(widget.news.id);
                        } else context.read<JetNewsProvider>().bookMark.add(widget.news.id);
                      });
                    }),
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
      ),
    );
  }
}
