import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';

import 'bottom_app_bar.dart';

class DetailPages extends StatefulWidget {
  Result news;

  DetailPages(this.news);

  @override
  _DetailPagesState createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
      List<Widget> items =[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      for(int i = 0; i < widget.news.paragraphs.length; i++) {
        if (widget.news.paragraphs[i].type == "Text") {
        items.add(Column(
          children: [
            Text(widget.news.paragraphs[i].text,
            style: TextStyle(
              height: 1.5,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),),
            SizedBox(height: 16.0,)
          ],
        ));
        } else if (widget.news.paragraphs[i].type == "CodeBlock") {
          List codes = widget.news.paragraphs[i].text.split('/').toList();
          List<Text> texts = codes.map((e) => Text(e)).toList();
          items.add(Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Colors.grey,
            child: Column(
              children: texts,
            ),
          ));
        } else if (widget.news.paragraphs[i].type == "Header") {
          items.add(Column(
            children: [
              Text(widget.news.paragraphs[i].text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 16.0,)
            ],
          ));
        } else items.add(Text(widget.news.paragraphs[i].text));

      }
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Published in: ${widget.news.publication.name}',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    '${widget.news.publication.logoUrl}',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.news.title,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
                widget.news.subtitle,
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.account_circle_sharp,
                    size: 42,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.news.publication.name,
                        style: TextStyle(color: Colors.black45),
                      ),
                      Text(
                        '${widget.news.metadata.date}•${widget.news.metadata.readTimeMinutes} min read',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Column(
                children: items
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }
}


