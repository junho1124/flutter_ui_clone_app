import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/interests_page/people/people_tab.dart';
import 'package:flutter_ui_clone_app/src/interests_page/publications/publications_tab.dart';
import 'package:flutter_ui_clone_app/src/interests_page/topics/topics_tab.dart';
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
                Tab(
                    child: Text('Topics',
                        style: TextStyle(
                          fontSize: 16,
                        ))),
                Tab(
                    child: Text('People',
                        style: TextStyle(
                          fontSize: 16,
                        ))),
                Tab(
                    child: Text('Publications',
                        style: TextStyle(
                          fontSize: 16,
                        ))),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Topics(),
              People(),
              Publications(),
            ],
          )),
    );
  }
}




