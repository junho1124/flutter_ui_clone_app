import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/drawer/my_drawer.dart';
import 'package:flutter_ui_clone_app/src/jetnews/interests_page/make_programming_items.dart';
import 'package:flutter_ui_clone_app/src/jetnews/interests_page/make_technology_items.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';
import 'make_android_items.dart';

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
              SingleChildScrollView(
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
              ),
              Tab(child: Text('People')),
              Tab(child: Text('Publications')),
            ],
          )),
    );
  }
}


