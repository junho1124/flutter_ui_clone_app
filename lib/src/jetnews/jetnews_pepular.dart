import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_popular_card.dart';

class JetNewsPopular extends StatelessWidget {
  const JetNewsPopular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular on Jetnews",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        CarouselSlider(
          items: [PopularCard(), PopularCard(), PopularCard()],
          options: CarouselOptions(
            enableInfiniteScroll: false,

          ),
        ),
        SizedBox(height: 8.0,),
        Divider(color: Colors.blueGrey,),
      ],
    );
  }
}
