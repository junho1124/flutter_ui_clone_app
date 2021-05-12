import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ui_clone_app/results/posts_results.dart';

class JetNewsProvider extends ChangeNotifier {

  List<Result> _jetNews = [];

  bool _isTab = true;

  bool _isLoading = true;


  List<Result> get jetNews => _jetNews;

  bool get isTab => _isTab;

  bool get isLoading => _isLoading;


  void tabbed() {
    _isTab = !_isTab;
    notifyListeners();
  }

  void loading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<PostsResult> fetchData() async {
    var uri = Uri.parse(
        'https://junho1124.github.io/web_test/posts.json');
    var response = await http.get(uri);
    PostsResult result = PostsResult.fromJson(json.decode(response.body));
    for (int i = 0; i < result.result.length; i++) {
    _jetNews.add(result.result[i]);
    }
    notifyListeners();
    return result;
  }


}