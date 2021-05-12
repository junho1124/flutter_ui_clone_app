import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/drawer/my_drawer.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_pepular.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_popular_sub.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_top_stories.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_top_sub.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return context.read<JetNewsProvider>().isLoading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Jetnews'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JetNewsTopStories(context.read<JetNewsProvider>().jetNews),
              JetNewsTopSub(context.read<JetNewsProvider>().jetNews),
              JetNewsPopular(context.read<JetNewsProvider>().jetNews),
              JetNewsPopularSub(context.read<JetNewsProvider>().jetNews),
            ],
          ),
        ),
      ),
    );
  }
}