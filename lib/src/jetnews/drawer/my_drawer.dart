import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

import 'drawer_head.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHead(),
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.read<JetNewsProvider>().isTab ? Color(0xffffb3c3) : null,
            ),
            child: ListTile(
              leading: Icon(Icons.home,
                color: context.read<JetNewsProvider>().isTab ? Color(0XFFCF233D) : Colors.black45,
                size: 22,),
              title: Text('Home',
                style: TextStyle(
                  fontSize: 18,
                  color: context.read<JetNewsProvider>().isTab ? Color(0XFFCF233D) : Colors.black45,
                ),),
              onTap: () {
                setState(() {
                  context.read<JetNewsProvider>().tabbed();
                });
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.read<JetNewsProvider>().isTab ? null : Color(0xffffb3c3),
            ),
            child: ListTile(
              leading: Icon(Icons.list_alt_outlined,
                color: context.read<JetNewsProvider>().isTab ? Colors.black45 : Color(0XFFCF233D),
                size: 22,),
              title: Text('Interests',
                style: TextStyle(
                  fontSize: 18,
                  color: context.read<JetNewsProvider>().isTab ? Colors.black45 : Color(0XFFCF233D),
                ),),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => InterestsPage()));
                Navigator.pop(context);
                setState(() {
                  context.read<JetNewsProvider>().tabbed();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
