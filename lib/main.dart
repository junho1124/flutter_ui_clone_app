import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/interests_page/interests_page.dart';
import 'package:flutter_ui_clone_app/src/jetnews/main_page/my_home_page.dart';

import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => JetNewsProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    context.read<JetNewsProvider>().fetchData().then((jetNewsResult) {
      setState(() {
        for (int i = 0; i < jetNewsResult.result.length; i++) {
          context.read<JetNewsProvider>().jetNews.add(jetNewsResult.result[i]);
        }
        context.read<JetNewsProvider>().loading();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(backgroundColor: Color(0XFFCF233D))),
        home: Consumer<JetNewsProvider>(
          builder: (BuildContext context, JetNewsProvider, Widget child) {
            return JetNewsProvider.isTab ? MyHomePage() : InterestsPage();
          },
        ));
  }
}
