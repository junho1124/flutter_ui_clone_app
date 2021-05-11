import 'package:flutter/material.dart';
//TODO IconButton 으로 수정
BottomAppBar bottomAppBar() {
  return BottomAppBar(
    child: Row(
      children: [
        SizedBox(width: 8.0,),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border,
                  size: 30,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.bookmark_border,
                  size: 30,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.share_rounded,
                  size: 30,),
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
    ),
  );
}