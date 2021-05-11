import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_pepular.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_popular_sub.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_top_stories.dart';
import 'package:flutter_ui_clone_app/src/jetnews/jetnews_top_sub.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(backgroundColor: Color(0XFFCF233D))),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => JetNewsProvider())
      ],
        child: MyHomePage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() { //TODO initState 안쓰고도 할 수 있는 방법 없나,,,,,
    super.initState();

    context.read<JetNewsProvider>().fetchData().then((jetNewsResult) {
      setState(() {
        for (int i = 0; i < jetNewsResult.result.length; i++) {
          context.read<JetNewsProvider>().jetNews.add(jetNewsResult.result[i]);
        }
        print(context.read<JetNewsProvider>().jetNews[0]);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              IconButton(icon: Icon(Icons.wysiwyg), onPressed: () {}),
              Text('JetNews'),
              // Text('${context.read<JetNewsProvider>().jetNews[0].title}'),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JetNewsTopStories(context.read<JetNewsProvider>().jetNews[2]),
              JetNewsTopSub(context.read<JetNewsProvider>().jetNews),
              JetNewsPopular(),
              JetNewsPopularSub(),
              JetNewsPopularSub(),
              JetNewsPopularSub(),
            ],
          ),
        ),
      ),
    );
  }
}
