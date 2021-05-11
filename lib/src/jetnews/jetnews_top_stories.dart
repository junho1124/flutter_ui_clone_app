import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';
import 'package:flutter_ui_clone_app/src/jetnews/detail_page/detail_page.dart';

class JetNewsTopStories extends StatelessWidget {
  Result news;



  JetNewsTopStories(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPages(news)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top stories for you",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16,),
          Center(
            child: Image.network(
                "${news.publication.logoUrl}"
            ),
          ),
          SizedBox(height: 16,),
          Text('${news.title}',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 4,),
          Text('${news.metadata.author.name}',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54
            ),),
          SizedBox(height: 4,),
          Text('${news.metadata.date}',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black38
            ),),
          SizedBox(height: 8,),
          Divider(color: Colors.blueGrey,),

        ],
      ),
    );
  }


}