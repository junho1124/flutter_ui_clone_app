// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_clone_app/results/posts_results.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {

  test('http 통신 테스트', () async {
    var uri = Uri.parse('https://junho1124.github.io/web_test/posts.json');
    var response = await http.get(uri);
    expect(response.statusCode, 200);

    PostsResult result = PostsResult.fromJson(json.decode(response.body));


    expect(result.result[0].imageId, 2131165292);
    print(result.result[0].title);
  });
}
