import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';
import 'make_android_items.dart';
import 'make_programming_items.dart';
import 'make_technology_items.dart';

class Topics extends StatelessWidget {
  const Topics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Andriod',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8.0),
            AndroidItems(context.read<JetNewsProvider>().android),
            SizedBox(height: 16.0),
            Text('Programming',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8.0),
            ProgrammingItems(context.read<JetNewsProvider>().programming),
            SizedBox(height: 16.0),
            Text('Technology',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8.0),
            TechnologyItems(context.read<JetNewsProvider>().tecgnology),
          ],
        ),
      ),
    );
  }
}