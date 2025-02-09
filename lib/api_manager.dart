import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_model.dart';
import 'package:news/models/sources_model.dart';

class ApiManager {
  static Future<SourcesModel> getSources(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","category":categoryId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesModel sourcesModel = SourcesModel.fromJson(json);

    return sourcesModel;
  }

  static Future <NewsModel> getNewsData(String sourceId)async{
    Uri url=Uri.https("newsapi.org","/v2/everything",
    {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","sources":sourceId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsModel newsModel = NewsModel.fromJson(json);
    return newsModel;
  }
}
