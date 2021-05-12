import 'package:flutter/material.dart';
import 'make_people_items.dart';


class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('People',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8.0),
            PeopleItems(),
          ],
        ),
      ),
    );
  }
}