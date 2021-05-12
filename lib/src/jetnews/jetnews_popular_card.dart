import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';
import 'package:flutter_ui_clone_app/src/detail_page/detail_page.dart';


class PopularCard extends StatelessWidget {
  List<Result> news;

  PopularCard(this.news);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: news.map((e) => MakeCards(e)).toList(),
        options: CarouselOptions(enableInfiniteScroll: false));
  }
}

class MakeCards extends StatelessWidget {
  MakeCards(this.news);

  final Result news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPages(news)));
      },
      child: Container(
        height: 600,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 400,
                child: Image.network("${news.publication.logoUrl}"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${news.title}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${news.metadata.author.name}',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${news.metadata.date} - ${news.metadata.readTimeMinutes} min read',
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
