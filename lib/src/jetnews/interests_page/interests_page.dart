import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/drawer/my_drawer.dart';


class InterestsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            centerTitle: false,
            title: Text('Interests'),
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Topics')),
                Tab(child: Text('Topics')),
                Tab(child: Text('Topics')),
              ],
            ),
          ),
          body: Column(
            children: [
            ],
          ),
        ),
      );
  }
}
