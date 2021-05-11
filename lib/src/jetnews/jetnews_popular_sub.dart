import 'package:flutter/material.dart';

class JetNewsPopularSub extends StatelessWidget {
  const JetNewsPopularSub({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  child: Image.network("https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png")),
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
                  Text("-------------------제목--------------------",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  Row(
                    children: [
                      Text("게시자 - 지난 시간",
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
    );
  }
}