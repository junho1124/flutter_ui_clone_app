import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 400,
              child: Image.network(
                  "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '제목',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '게시자',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '게시일 - 지난 시간',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black38),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}