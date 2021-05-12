import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';
//TODO IconButton 으로 수정
class BottomBar extends StatefulWidget {
  BottomBar(this.news);

  Result news;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.0,),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                  icon: context.read<JetNewsProvider>().like.contains(widget.news.id)
                      ? Icon(Icons.favorite,
                    size: 30,)
                      : Icon(Icons.favorite_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                    if (context.read<JetNewsProvider>().like.contains(widget.news.id)) {
                      context.read<JetNewsProvider>().like.remove(widget.news.id);
                    } else context.read<JetNewsProvider>().like.add(widget.news.id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: context.read<JetNewsProvider>().bookMark.contains(widget.news.id)
                      ? Icon(Icons.bookmark,
                    size: 30,)
                      : Icon(Icons.bookmark_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                    if (context.read<JetNewsProvider>().bookMark.contains(widget.news.id)) {
                      context.read<JetNewsProvider>().bookMark.remove(widget.news.id);
                    } else context.read<JetNewsProvider>().bookMark.add(widget.news.id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.share_rounded,
                    size: 30,),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.text_fields,
                  size: 30,),
              ],
            )
        ),
        SizedBox(width: 16.0,),
      ],
    );
  }
}