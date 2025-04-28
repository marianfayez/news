import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news/cache_helper.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/sources_model.dart';
import 'package:news/repository/home_repo.dart';
import 'package:http/http.dart' as http;

class RepoRemoteImpl implements HomeRepo{
  @override
  Future<NewsModel> getNews(String sourceId) async{
    Uri url=Uri.https("newsapi.org","/v2/everything",
        {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","sources":sourceId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsModel newsModel= NewsModel.fromJson(json);
    await HiveService.saveNews(newsModel,sourceId);
    debugPrint("News saved");
    return newsModel;
  }

  @override
  Future<SourcesModel> getSources(String categoryId) async{
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","category":categoryId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesModel sourcesModel= SourcesModel.fromJson(json);
    await HiveService.saveSources(sourcesModel,categoryId);
    debugPrint("sources saved");
    return sourcesModel;
  }


}