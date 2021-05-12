import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';
import 'package:flutter_ui_clone_app/src/detail_page/detail_page.dart';


class JetNewsPopularSub extends StatelessWidget {
  List<Result> news;

  JetNewsPopularSub(this.news);

  @override
  Widget build(BuildContext context) {
    List<MakePopularItems> items = [];
    for (int i = 4; i < 7; i++) {
      items.add(MakePopularItems(news: news[i]));
    }
    return Column(
      children: items,
    );
  }
}

class MakePopularItems extends StatelessWidget {
  const MakePopularItems({
    Key key,
    @required this.news,
  }) : super(key: key);

  final Result news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPages(news)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: 40,
                    child: Image.network("${news.publication.logoUrl}")),
              ),
              SizedBox(width: 8,),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BASED ON YOUR HISTORY",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black26
                      ),),
                    Text("${news.title}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    Row(
                      children: [
                        Text("${news.metadata.author.name} - ${news.metadata.readTimeMinutes} min read",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38
                          ),),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.more_vert),
                    onPressed: () {}
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Divider(color: Colors.blueGrey,),
        ],
      ),
    );
  }
}