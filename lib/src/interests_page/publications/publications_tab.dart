import 'package:flutter/material.dart';

import 'make_publications_items.dart';



class Publications extends StatefulWidget {
  @override
  _PublicationsState createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Publications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8.0),
            PublicationsItems(),
          ],
        ),
      ),
    );
  }
}